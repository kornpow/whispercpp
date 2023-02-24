"""Internal dependencies declaration, includes dependencies for examples, and gRPC clients."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def internal_deps():
    """Load internal dependencies that are used within the BentoML projects."""

    # whisper.cpp
    maybe(
        new_git_repository,
        name = "com_github_ggerganov_whisper",
        build_file = Label("//extern:whispercpp.BUILD"),
        commit = "0d229163bbea769c7a3e0e500e45850c9a6e2e42",
        init_submodules = True,
        recursive_init_submodules = True,
        remote = "https://github.com/ggerganov/whisper.cpp.git",
        shallow_since = "1676824501 +0200",
    )
    maybe(
        http_archive,
        name = "rules_cc",
        sha256 = "3d9e271e2876ba42e114c9b9bc51454e379cbf0ec9ef9d40e2ae4cec61a31b40",
        strip_prefix = "rules_cc-0.0.6",
        urls = ["https://github.com/bazelbuild/rules_cc/releases/download/0.0.6/rules_cc-0.0.6.tar.gz"],
    )

    maybe(
        http_archive,
        name = "pybind11_bazel",
        sha256 = "bc12ae921f521581894e30a5b156c226f6c5745cab0904fc4c16c6dbccc54173",
        strip_prefix = "pybind11_bazel-bebf131a6a29b34a6e18eab5ed75d899a44d60e7",
        urls = ["https://github.com/pybind/pybind11_bazel/archive/bebf131a6a29b34a6e18eab5ed75d899a44d60e7.zip"],
    )
    maybe(
        http_archive,
        name = "pybind11",
        build_file = "@pybind11_bazel//:pybind11.BUILD",
        sha256 = "5d8c4c5dda428d3a944ba3d2a5212cb988c2fae4670d58075a5a49075a6ca315",
        strip_prefix = "pybind11-2.10.3",
        urls = ["https://github.com/pybind/pybind11/archive/v2.10.3.tar.gz"],
    )

    maybe(
        http_archive,
        name = "bazel_skylib",
        sha256 = "74d544d96f4a5bb630d465ca8bbcfe231e3594e5aae57e1edbf17a6eb3ca2506",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "com_github_bazelbuild_buildtools",
        sha256 = "ae34c344514e08c23e90da0e2d6cb700fcd28e80c02e23e4d5715dddcb42f7b3",
        strip_prefix = "buildtools-4.2.2",
        urls = [
            "https://github.com/bazelbuild/buildtools/archive/refs/tags/4.2.2.tar.gz",
        ],
    )

    # python rules
    maybe(
        http_archive,
        name = "rules_python",
        sha256 = "29a801171f7ca190c543406f9894abf2d483c206e14d6acbd695623662320097",
        strip_prefix = "rules_python-0.18.1",
        url = "https://github.com/bazelbuild/rules_python/releases/download/0.18.1/rules_python-0.18.1.tar.gz",
    )