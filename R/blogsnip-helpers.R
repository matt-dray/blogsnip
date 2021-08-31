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

bs_session_details <- function() {
  
  rstudioapi::insertText(
    paste0(
      '---\n',
      '<details><summary>Session info</summary>\n',
      '```{r sessioninfo, echo=FALSE}\n',
      'sessioninfo::session_info()\n',
      '```\n',
      '</details>'
    )
  )
  
}

#' Embed Tweet
#'
#' Replace a Twitter shortcode with a chunk that contains code to embed the
#' tweet. Also names the chunk after the shortcode.
#'
#' @export

bs_embed_tweet <- function() {
  
  active_doc <- rstudioapi::getSourceEditorContext()
  
  if (!is.null(active_doc)) {
    
    selected_text <- active_doc$selection[[1]]$text
    
    text_replace <- paste0(
      '```{r ', selected_text, ', echo=FALSE}\n',
      'blogdown::shortcode("tweet", "', selected_text, '")\n',
      '```\n'
    )
    
    rstudioapi::modifyRange(active_doc$selection[[1]]$range, text_replace)
    
  }
  
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
      '<img src="image.png" alt="Descriptive text." width="100%"/>\n',
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

#' Add Blank Target to Links
#'
#' In selected text, append \code{{target='_blank'}} to all links that are in
#' the form \code{[]()}.
#'
#' @export

bs_blank_target <- function() {
  
  active_doc <- rstudioapi::getSourceEditorContext()
  
  if (!is.null(active_doc)) {
    
    # The text element of the active_doc object
    selected_text <- active_doc$selection[[1]]$text
    
    # Extract the link from the highlighted text
    extracted_link <- stringi::stri_extract_all_regex(
      selected_text,
      "\\[(.*?)\\]\\((.*?)\\)"
    )[[1]]
    
    if (length(extracted_link) == 0) {
      
      # Don't need to replace a link that already has {target='blank'}
      selected_text_replacement <- selected_text
      
    } else {
      
      # Create regex-friendly link string (i.e. escape '[' with '\\')
      extracted_link_regex <- gsub(
        "([.|()\\^{}+$*?]|\\[|\\])", "\\\\\\1", extracted_link
      )
      
      # Create replacement link string
      replacement_link <- paste0(extracted_link, "{target='_blank'}")
      
      # Remove current {target='_blank'} from selected text
      selected_text_no_blank <- stringi::stri_replace_all_regex(
        selected_text,
        paste0(
          "\\{target='_blank'\\}|\\{target = '_blank'\\}|",
          "\\{target=\"_blank\"\\}|\\{target = \"_blank\"\\}"
        ),
        ""
      )
      
      # Replace extracted links with new links
      selected_text_replacement <- stringi::stri_replace_all_regex(
        selected_text_no_blank,
        extracted_link_regex,
        replacement_link,
        vectorize_all = FALSE
      )
      
      # Hacky fix for when multiple links in the selected text are the same,
      # which produces a double set of blank targets, like: 
      # [link](https://www.example.com){target='_blank'}{target='_blank'}
      selected_text_replacement <- stringi::stri_replace_all_regex(
        selected_text_replacement,
        "(\\{target='_blank'\\}){2,}",  # two or more instances
        "\\{target='_blank'\\}"  # replace with single
      )
      
    }
    
    # Modify selected text, replacing links to include {target='_blank'}
    rstudioapi::modifyRange(
      active_doc$selection[[1]]$range, selected_text_replacement
    )
    
  }
  
}

#' Add Named Anchor
#'
#' Add a named anchor to the selected text, generating a hyphenated tag in the
#' process. Remember to add '{#anchor-tag}' to where your anchoring to.
#'
#' @export

bs_named_anchor <- function() {
  
  active_doc <- rstudioapi::getActiveDocumentContext()
  
  if (!is.null(active_doc)) {
    
    selected_text <- active_doc$selection[[1]]$text
    
    anchor_tag <- tolower(selected_text)
    anchor_tag <- stringi::stri_replace_all_regex(anchor_tag, "[:punct:]", "")
    anchor_tag <- stringi::stri_replace_all_regex(anchor_tag, "[:space:]", "-")
    
    text_replace <- paste0('[', selected_text, '](#', anchor_tag, ')')
    
    rstudioapi::modifyRange(active_doc$selection[[1]]$range, text_replace)
    
  }
  
}

#' Add Closing Paren Labels [WIP]
#'
#' In development. Adds comments after closing parentheses in your selection 
#' with the name of the function being closed (sometimes called 'biscuits'). 
#' Warning: also styles the file. Please check the output.
#'
#' @export

bs_add_biscuits <- function() {
  
  active_doc <- rstudioapi::getActiveDocumentContext()
  
  if (!is.null(active_doc)) {
    
    selected_text <- active_doc$selection[[1]]$text
    
    text_replace <- .add_biscuits(selected_text)
    
    rstudioapi::modifyRange(active_doc$selection[[1]]$range, text_replace)
    
  }
  
}
