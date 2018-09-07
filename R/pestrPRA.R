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
#' @inheritParams rmarkdown::html_document
#' @inheritParams rmarkdown::pdf_document
#' @param extra_dependencies,... Additional function arguments to pass to the
#'        base R Markdown HTML output formatter
#' @rdname eppoPRA
#' @export
invasive_plants_PRA1 <- function(
                  link_citations = TRUE,
                  toc = FALSE,
                  toc_depth = 3,
                  smart = TRUE,
                  graphics = TRUE,
                  comapct_title = TRUE,
                  self_contained = TRUE,
                  always_allow_html = TRUE,
                  urlcolor = 'Cerulean',
                  linkcolor = 'TealBlue',
                  citecolor = 'TealBlue',
                  highlight = "none",
                  extra_dependencies = NULL,
                  css = NULL,
                  includes = NULL,
                  keep_md = FALSE,
                  lib_dir = NULL,
                  md_extensions = NULL,
                  pandoc_args = NULL,
                  ...) {
  template <- "template.tex"
  code_folding <- "none"

  args <- c("--standalone")
  args <- c(args, "--csl", "elsevier-harvard.csl")

  if (number_sections)
    args <- c(args, "--number-sections")

  for (css_file in css)
    args <- c(args, "--css", rmarkdown::pandoc_path_arg(css_file))

  pre_processor <- function(metadata, input_file, runtime,
                            knit_meta, files_dir, output_dir) {

    if (is.null(lib_dir)) lib_dir <- files_dir

    args <- c()
    args <- c(args, pandoc_html_highlight_args(highlight,
                                               template, self_contained, lib_dir,
                                               output_dir))
    args <- c(args, includes_to_pandoc_args(includes = includes,
                                            filter = if (identical(runtime, "shiny"))
                                              normalize_path else identity))
    args

  }
}

#' @inheritParams rmarkdown::pdf_document
#' @param extra_dependencies,... Additional function arguments to pass to the
#'        base R Markdown HTML output formatter
#' @rdname eppoPRA
#' @export
eppo_invasive_pdf <- function(toc = FALSE, highlight = "default", ...){

  base <- bookdown::pdf_document2(template = 'template.tex',
                                  toc = toc,
                                  highlight = highlight,
                                  #keep_tex = TRUE,
                                  #dev = 'cairo_pdf',
                                  #latex_engine = 'xelatex',
                                  ...)

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_chunk$comment <- NA
  #base$knitr$opts_chunk$fig.align <- "center"

  old_opt <- getOption("bookdown.post.latex")
  options(bookdown.post.latex = fix_envs)
  on.exit(options(bookdown.post.late = old_opt))

  base

}

#' @inheritParams rmarkdown::html_document
#' @param extra_dependencies,... Additional function arguments to pass to the
#'        base R Markdown HTML output formatter
#' @rdname eppoPRA
#' @export
eppo_invasive_html <- function(toc = FALSE, highlight = "default", ...){

  base <- bookdown::html_document2(template = 'template.html',
                                  toc = toc,
                                  highlight = highlight,
                                  keep_tex = TRUE,
                                  dev = 'cairo_pdf',
                                  latex_engine = 'xelatex',
                                  ...)

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_chunk$comment <- NA
  #base$knitr$opts_chunk$fig.align <- "center"

  old_opt <- getOption("bookdown.post.latex")
  options(bookdown.post.latex = fix_envs)
  on.exit(options(bookdown.post.late = old_opt))

  base

}

fix_envs = function(x){
  beg_reg <- '^\\s*\\\\begin\\{.*\\}'
  end_reg <- '^\\s*\\\\end\\{.*\\}'
  i3 = if (length(i1 <- grep(beg_reg, x))) (i1 - 1)[grepl("^\\s*$", x[i1 - 1])]

  i3 = c(i3,
         if (length(i2 <- grep(end_reg, x))) (i2 + 1)[grepl("^\\s*$", x[i2 + 1])]
  )
  if (length(i3)) x = x[-i3]
  x
}
