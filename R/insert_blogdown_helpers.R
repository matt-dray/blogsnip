#' Insert expandable details block.
#'
#' Call this function as an addin to insert at the cursor position an expandable
#' HTML details block containing an R Markdown chunk containing the session info
#' and current system date. 
#'
#' @export
addin_details <- function() {
  
  rstudioapi::insertText('<details><summary>Session info</summary>
```{r sessioninfo, echo=FALSE}
paste("Last updated", Sys.Date())
sessionInfo()
```
</details>'
  )

}

#' Insert accessible image HTML.
#'
#' Call this function as an addin to insert at the cursor position an HTML block
#' that allows for the alt text and caption to differ, unlike \code{ ![]() }
#' syntax.
#'
#' @export
addin_img_accessible <- function() {
  
  rstudioapi::insertText('<div class="figure">
<img src="path/to/img.png" alt="Descriptive alternative text." width=500 />
<p class="caption">This is a caption</p>
</div>'
  )
  
}


#' Insert link that opens in a new tab.
#'
#' Call this function as an addin to insert at the cursor position a web link
#' that opens in a new tab rather than the current tab.
#'
#' @export
addin_new_tab <- function() {
  
  rstudioapi::insertText('[Blog](https://rostrum.blog/){target="_blank"}')
  
}
