# pestrPRA
RMarkdown extension for [bookdown](https://github.com/rstudio/bookdown) to create PRA reports templates.
 
## Installation

You can install and use **pestrPRA** development version from GitHub as follows:

```r
devtools::install_github("mczyzj/pestrPRA")
```

## Overview

 Current, developmental versions supports template for:
 - Express Pest Risk Analysis (see [EPPO](https://www.eppo.int/RESOURCES/eppo_standards/pm5_pra)) in English;
 - Express Pest Risk Analysis for Invasive Plants in English;
 - polish version that combines elements from both templates (this approach is currently adopted for PRA in Poland, examples of polish PRA that were created **without** this package can be seen on [plant quarantine site](https://www.plantquarantine.pl)).
 
 ## Why?
 
 It is extremely hard to maintain nice looking, well formatted documents when you need to work with dozen other assessors / scientists when each of them is using different OS, document editor, etc. After few rounds your nice template in \*.doc format looks like garbage and trying to make it work take ages. Working in LaTeX is not an option, since most of your coworkers find it to complicated to use. The one solution is to use RMarkdown, that allows easy document edition. The only problem is to begin with well formatted template -- which is not an easy task. Hopefully, now complete template for both english EPPO PRA as well as polish PRA template is available. Moreover all of templates that are currently in **pestrPRA** package converge to pdf and html format from one set of \*.rmd files.

## Usage

This package was tested and proven to correctly generate \*.pdf files with **Ubuntu** 16.10 with *TeX Live* 2018 and 18.04 with *TeX Live* 2017. I cannot guarantee at the moment that ther is a way to make \*.pdf under **Windows**, nevertheless \*.html output should work.

You can create new folder with all the necessary files using RStudio menu > File > New file > RMarkdown > Template

or by using `rmarkdown::draft()` command, e.g.
```r
    rmarkdown::draft("Hzea.Rmd", template = "eppo_pest_pdf", package = "pestrPRA")
```

## Tables

Most important tables, that one should fill are stored in separate \*.csv files. Their should be filled manualy, however some information, e.g.:
- hosts
- taxonomy
- preferred name, synonyms and common names
- distribution
- categorization

can be downloaded automaticaly from **EPPO data services** by using [pestr](https://github.com/mczyzj/pestr) package.
