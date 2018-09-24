#' EPPO Express Pest Risk Analysis Reports
#'
#' Template for creating an R markdown document using the EPPO Express
#' Pest Risk Analysis reports
#'
#' Based on the
#' \href{https://www.eppo.int/RESOURCES/eppo_standards/pm5_pra}{EPPO PRA}.
#'
#' @encoding UTF-8
#'
#' @inheritParams rmarkdown::pdf_document
#' @param extra_dependencies,... Additional function arguments to pass to the
#'        base R Markdown pdf output formatter
#' @rdname eppoPRA
#' @export
eppo_invasive_pdf <- function(toc = FALSE, highlight = "default", ...){

  expressPRA <- bookdown::pdf_document2(template = 'template.tex',
                                        toc = toc,
                                        highlight = highlight,
                                        #keep_tex = TRUE,
                                        #dev = 'cairo_pdf',
                                        #latex_engine = 'xelatex',
                                        ...)

  expressPRA
}

#' @inheritParams rmarkdown::pdf_document
#' @param extra_dependencies,... Additional function arguments to pass to the
#'        base R Markdown pdf output formatter
#' @rdname eppoPRA
#' @export
eppo_pest_pdf <- function(toc = FALSE, highlight = "default", ...){

  expressPRA <- bookdown::pdf_document2(template = 'template.pdf',
                                          toc = toc,
                                          highlight = highlight, ...)
                                          #keep_tex = TRUE,
                                          #dev = 'cairo_pdf',
                                          #latex_engine = 'xelatex',

  expressPRA
}

## In case of further difrentiation into separate functions for html and
## pdf output, below there are skeletons for functions.

## #' @inheritParams rmarkdown::html_document
## #' @param extra_dependencies,... Additional function arguments to pass to the
## #'        base R Markdown HTML output formatter
## #' @rdname eppoPRA
## #' @export
## eppo_pest_html <- function(toc = FALSE, highlight = "default", ...){
##   expressPRA <- bookdown::html_document2(template = 'template.html',
##                                           toc = toc,
##                                           highlight = highlight,
##                                           #keep_tex = TRUE,
##                                           #dev = 'cairo_pdf',
##                                           #latex_engine = 'xelatex',
##                                           ...)

##   expressPRA
## }

## #' @inheritParams rmarkdown::html_document
## #' @param extra_dependencies,... Additional function arguments to pass to the
## #'        base R Markdown HTML output formatter
## #' @rdname eppoPRA
## #' @export
## eppo_invasive_html <- function(toc = FALSE, highlight = "default", ...){

##  expressPRA <- bookdown::html_document2(template = 'template.html',
##                                         toc = toc,
##                                         highlight = highlight, ...)
##                                         #keep_tex = TRUE,
##                                         #dev = 'cairo_pdf',
##                                         #latex_engine = 'xelatex',

##  expressPRA

## }
