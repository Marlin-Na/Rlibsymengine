
#' @export
PkgPath <- function () {
    system.file(package = "Rlibsymengine", mustWork = TRUE)
}

# #' @export
# IPath <- function () {
#     system.file("include", package = "Rlibsymengine", mustWork = TRUE)
# }

#' @export
PkgLibsFlags <- function () {
    libs <- c("-lgmp", "-lmpfr", "-lmpc") # TODO: bfd, etc.

    # Try to search for the static libraries, the location may be platform-dependent

    pkg.path <- PkgPath()

    # libsymengine.a, it locates at "lib64/libsymengine.a" on my computer
    # It may located at `lib` or `lib64`?
    # TODO: test on MacOS and Windows?
    lsymengine <-
        c(list.files(file.path(pkg.path, "lib"),
                     pattern = "^libsymengine\\.(a|lib)$", full.names = TRUE),
          list.files(file.path(pkg.path, "lib64"),
                     pattern = "^libsymengine\\.(a|lib)$", full.names = TRUE))
    if (length(lsymengine) != 1L)
        stop(sprintf("Error finding the static library of symengine in %s", pkg.path))

    # Try to find liblteuchos.a
    lteuchos <-
        c(list.files(file.path(pkg.path, "lib"),
                     pattern = "^libteuchos\\.(a|lib)$", full.names = TRUE),
          list.files(file.path(pkg.path, "lib64"),
                     pattern = "^libteuchos\\.(a|lib)$", full.names = TRUE))
    if (length(lteuchos) != 1L)
        stop(sprintf("Error finding the static library of teuchos in %s", pkg.path))

    # Expect to be the same?
    stopifnot(dirname(lsymengine) == dirname(lteuchos))

    ans <- c(libs, lsymengine, lteuchos)
    ans
}

