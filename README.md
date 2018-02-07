
This R package aims to ship the static library of 
[SymEnigne](https://github.com/symengine/symengine) for installation
of the [symengine R package](https://github.com/marlin-na/symengine.R).

It tracks the upstream repository in `inst/symengine`, and provides a `configure`
script to compile it into a static library.

To install, you will first need to install some prerequisites, for example
on a Debian-based system:

```sh
sudo apt-get install cmake libgmp-dev libmpfr-dev libmpc-dev binutils-dev
```

Then in R, try:

```R
devtools::install_github("marlin-na/Rlibsymengine")
```

Note that windows is currently not supported.

This package is provided so that user do not need a system-wide installation
of symengine, it also tracks the latest source of symengine.

At the installation time of the
[symengine R package](https://github.com/marlin-na/symengine.R), the static code
from this package is incorporated into the symengine package, then this package
can be removed. Correspondingly, updating symengine lib requires both updating
this package and reinstalling the symengine R package. The approach taken here
is somehow similar to the one described in
[Section 5.8 of Writing R Extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html#Linking-to-other-packages).
An example package taking this approach is `Rsamtools` in bioconductor, see its
[vignette](http://bioconductor.org/packages/2.10/bioc/vignettes/Rsamtools/inst/doc/Rsamtools-UsingCLibraries.pdf).

I keep it separated as an independent R package just for convenience of
experimenting the idea, it may or may not merged into the main repository in
future.

Note that symengine uses `CMake` as its build tool and the `configure` script
in this package calls `cmake`. Since the CRAN win-builder does not currently
provide win-builder, some effort may be needed to port symengine R package to
windows. Also see the discussions at 
https://stat.ethz.ch/pipermail/r-package-devel/2015q2/000097.html and
https://stat.ethz.ch/pipermail/r-package-devel/2016q2/000897.html .

