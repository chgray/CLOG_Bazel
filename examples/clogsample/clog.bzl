load(
    "@rules_dotnet//dotnet:defs.bzl",
    "csharp_binary",
    "csharp_library",
    "publish_binary",
    "csharp_nunit_test",
)

def clog(name, src, **kwargs):
  native.genrule(
    name = "clog_" + name + "_helper",
    srcs = ["clog_build.sh", src, "//examples:clog.sidecar", "//examples:clog_examples.clog_config", "//src/clogutils:clog.h"],
    outs = [src +".clog.h", "TEST_" + src + ".clog.h.c", src+".sidecar"],
    cmd =  "./$(location clog_build.sh) $(location //src/clog:clogP) $(location //examples:clog_examples.clog_config) $(location //examples:clog.sidecar) $(location :%s) $(@D) %s.sidecar" % (src, src),
    tools = ["//src/clog:clogP"]
  )
  
  native.cc_library(
    name = name,   
    hdrs = [ src + ".clog.h" ],
    includes = ["."],
  )

def _hello_world_impl(ctx):   
    files=[]
    #files.append(out)
    #files.append(out2)
     
    #ctx.actions.write(out, content = "")
    #ctx.actions.write(out2, content = "")
     
    for pack in ctx.attr.template:
       #print("**** analyzingx", pack)
       for file in pack.files.to_list():
          header = ctx.actions.declare_file(file.path + ".clog.h")
          source = ctx.actions.declare_file("TEST_" + file.path + ".clog.h.c")
          print("Adding ", file.path + ".clog.h")
          files.append(header)
        #ctx.actions.write(file, content = "")
        
       # files.append(pack)
       #myinput = pack #ctx.actions.declare_file(pack)
      #  myout = ctx.actions.declare_file(".temp")
      #  myinput = ctx.actions.declare_file(".in_temp")
      #  print(myout.path)
      #  ctx.actions.write(
      #       output = myout,
      #       content = "Hello\n",
      #   )
    #print(files)
    
    # ctx.actions.run_shell(
    #   inputs=files,
    #   outputs=[myout],
    #   command="ls -l"
    #   )
      
    return [DefaultInfo(files = depset(files))]

hello_world = rule(
    implementation = _hello_world_impl,
    attrs = {
        "username": attr.string(default = "unknown person"),
        "template": attr.label_list(
            allow_files = [".cpp"],
            mandatory = True,
        ),
    },
)