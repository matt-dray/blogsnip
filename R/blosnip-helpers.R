#' Insert Details
#'
#' Inserts at the cursor position an expandable HTML details block.
#'
#' @export

bs_details_expand <- function() {
  
  rstudioapi::insertText(
    paste0(
      '<details><summary>Click for details</summary>\n',
      'Text goes here\n',
      '</details>'
    )
  )
  
}

#' Insert Session Details
#'
#' Inserts at the cursor position an expandable HTML details block that contains
#' the date of the last update and session information.
#'
#' @export

bs_session_details<- function() {
  
  rstudioapi::insertText(
    paste0(
      '---\n',
      '<details><summary>Session info</summary>\n',
      '```{r sessioninfo, echo=FALSE}\n',
      'paste("Last updated", Sys.Date())\n',
      'sessioninfo::session_info()\n',
      '```\n',
      '</details>'
    )
  )

}

#' Insert Accessible Image
#' 
#' Inserts at the cursor position some HTML image code that has caption and alt
#' text elements.
#'
#' @export

bs_img_accessible <- function() {
  
  rstudioapi::insertText(
    paste0(
      '<div class="figure">\n',
      '<img src="image.png" alt="Descriptive text." width=300/>\n',
      '<p class="caption">Text</p>\n',
      '</div>'
    )
  )
  
}

#' Make Into Link
#' 
#' Modify the selected text or URL into the form \code{[](){target='_blank'}}.
#' Thanks to
#' \href{https://www.hvitfeldt.me/blog/creating-rstudio-addin-to-modify-selection/}{Emil
#' Hvitfeldt's blog post} for guidance.
#'
#' @export

bs_make_link <- function() {
  
  active_doc <- rstudioapi::getActiveDocumentContext()
  
  if (!is.null(active_doc)) {
    
    selected_text <- active_doc$selection[[1]]$text
    
    text_replace <- ifelse(
      grepl("^http", selected_text) == TRUE,  # check if a link
      paste0('[](', selected_text, '){target="_blank"}'),
      paste0('[', selected_text, '](){target="_blank"}')
    )

    rstudioapi::modifyRange(active_doc$selection[[1]]$range, text_replace)
    
  }
}

#' Add {target='_blank'}

#' In selected text, append \code{{target='_blank'}} to links that are in
#' the form \code{[]()}.
#'
#' @export

bs_target_blank <- function() {
  
  active_doc <- rstudioapi::getSourceEditorContext()
  
  if (!is.null(active_doc)) {
    
    selected_text <- active_doc$selection[[1]]$text
    
    link <- stringr::str_extract_all(
      selected_text,
      "\\[.+?\\]\\(.+?\\)(?=[^\\{?])"
    )[[1]]

    link_rgx <- gsub("([.|()\\^{}+$*?]|\\[|\\])", "\\\\\\1", link)

    new_link <- paste0(link, "{target='_blank'}")

    text_replace <- stringr::str_replace(selected_text, link_rgx, new_link)

    rstudioapi::modifyRange(active_doc$selection[[1]]$range, text_replace)
    
  }
}

