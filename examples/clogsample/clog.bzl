def clog(name, src, size="100x100", **kwargs):

  native.genrule(
    name = name,
    srcs = [src],
    outs = ["small_" + src],
    cmd = "convert $< -resize " + size + " $@",
    **kwargs
  )