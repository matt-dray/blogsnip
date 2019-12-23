#' Insert Expandable Details Block
#'
#' Call this function as an addin to insert at the cursor position an expandable
#' HTML details block. 
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

#' Insert Expandable Session Details Block
#'
#' Call this function as an addin to insert at the cursor position an expandable
#' HTML details block containing an R Markdown chunk containing the session info
#' and current system date. 
#'
#' @export
bs_session_details <- function() {
  
  rstudioapi::insertText(
    paste0(
      '<details><summary>Session info</summary>\n',
      '```{r sessioninfo, echo=FALSE}\n',
      'paste("Last updated", Sys.Date())\n',
      'sessioninfo::session_info()\n',
      '```\n',
      '</details>'
    )
  )

}

#' Insert Accessible Image HTML
#'
#' Call this function as an addin to insert at the cursor position an HTML block
#' that allows for the alt text and caption to differ, unlike \code{ ![]() }
#' syntax.
#'
#' @export
bs_img_accessible <- function() {
  
  rstudioapi::insertText(
    paste0(
      '<div class="figure">\n',
      '<img src="path/to/img.png" alt="Descriptive alternative text." width=500 />\n',
      '<p class="caption">This is a caption</p>\n',
      '</div>'
    )
  )
  
}

#' Insert Link That Opens in a New Tab
#'
#' Call this function as an addin to insert at the cursor position some Markdown
#' that will open a web link in a new tab rather than the current tab.
#'
#' @export
bs_insert_link <- function() {
  
  rstudioapi::insertText('[](){target="_blank"}')
  
}

#' Add to Selection a Link to Open in a New Tab
#'
#' Call this function as an addin to replace selected text with Markdown to an
#' external link that opens in a new tab rather than the current tab. Thanks to
#' \href{https://www.hvitfeldt.me/blog/creating-rstudio-addin-to-modify-selection/}{Emil
#' Hvitfeldt's blog post} for guidance.
#'
#' @export

bs_replace_link <- function() {
  
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
