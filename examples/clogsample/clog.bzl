load(
    "@rules_dotnet//dotnet:defs.bzl",
    "csharp_binary",
    "csharp_library",
    "publish_binary",
    "csharp_nunit_test",
)

def clog(name, src, sidecarOutput, **kwargs):
  native.genrule(
    name = "clog_" + name,
    srcs = ["clog_build.sh", src, "//examples:clog.sidecar", "//examples:clog_examples.clog_config", "//src/clogutils:clog.h"],
    outs = [src +".clog.h", "TEST_" + src + ".clog.h.c", sidecarOutput],
    cmd =  "./$(location clog_build.sh) $(location //src/clog:clogP) $(location //examples:clog_examples.clog_config) $(location //examples:clog.sidecar) $(location :simple.cpp) $(@D) %s" % sidecarOutput,
    tools = ["//src/clog:clogP"]
  )