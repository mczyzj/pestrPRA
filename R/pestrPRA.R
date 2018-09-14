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

#  old_opt <- getOption("bookdown.post.latex")
#  options(bookdown.post.latex = fix_envs)
#  on.exit(options(bookdown.post.late = old_opt))

  expressPRA

}

#' @inheritParams rmarkdown::html_document
#' @param extra_dependencies,... Additional function arguments to pass to the
#'        base R Markdown HTML output formatter
#' @rdname eppoPRA
#' @export
eppo_invasive_html <- function(toc = FALSE, highlight = "default", ...){

  expressPRA <- bookdown::html_document2(template = 'template.html',
                                         toc = toc,
                                         highlight = highlight, ...)
                                         #keep_tex = TRUE,
                                         #dev = 'cairo_pdf',
                                         #latex_engine = 'xelatex',


#  old_opt <- getOption("bookdown.post.latex")
#  options(bookdown.post.latex = fix_envs)
#  on.exit(options(bookdown.post.late = old_opt))

  expressPRA

}

#' @inheritParams rmarkdown::pdf_document
#' @param extra_dependencies,... Additional function arguments to pass to the
#'        base R Markdown pdf output formatter
#' @rdname eppoPRA
#' @export
eppo_pest_pdf <- function(toc = FALSE, highlight = "default", ...){

  expressPRA <- bookdown::html_document2(template = 'template.pdf',
                                          toc = toc,
                                          highlight = highlight, ...)
                                          #keep_tex = TRUE,
                                          #dev = 'cairo_pdf',
                                          #latex_engine = 'xelatex',

  expressPRA
}
#' @inheritParams rmarkdown::html_document
#' @param extra_dependencies,... Additional function arguments to pass to the
#'        base R Markdown HTML output formatter
#' @rdname eppoPRA
#' @export
eppo_pest_pdf <- function(toc = FALSE, highlight = "default", ...){
  expressPRA <- bookdown::html_document2(template = 'template.html',
                                          toc = toc,
                                          highlight = highlight,
                                          #keep_tex = TRUE,
                                          #dev = 'cairo_pdf',
                                          #latex_engine = 'xelatex',
                                          ...)

  expressPRA
}
#fix_envs = function(x){
#  beg_reg <- '^\\s*\\\\begin\\{.*\\}'
#  end_reg <- '^\\s*\\\\end\\{.*\\}'
#  i3 = if (length(i1 <- grep(beg_reg, x))) (i1 - 1)[grepl("^\\s*$", x[i1 - 1])]
#
#  i3 = c(i3,
#         if (length(i2 <- grep(end_reg, x))) (i2 + 1)[grepl("^\\s*$", x[i2 + 1])]
#  )
#  if (length(i3)) x = x[-i3]
#  x
#}
