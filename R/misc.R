
#' @export
PkgPath <- function () {
    system.file(package = "Rlibsymengine", mustWork = TRUE)
}

#' @export
IPath <- function () {
    system.file("include", package = "Rlibsymengine", mustWork = TRUE)
}

#' @export
LPath <- function () {
    pkg <- PkgPath()
    # It may located at `lib` or `lib64`?
    # TODO: test on MacOS and Windows?
    if (length(list.files(file.path(pkg, "lib"), pattern = "^libsymengine\\.(a|lib)$")))
        return(file.path(pkg, "lib"))
    if (length(list.files(file.path(pkg, "lib64"), pattern = "^libsymengine\\.(a|lib)$")))
        return(file.path(pkg, "lib64"))
    stop("The static library is (may not be) not found in ",
         dQuote(file.path(pkg, "lib")), " and ", dQuote(file.path(pkg, "lib64")))
}

