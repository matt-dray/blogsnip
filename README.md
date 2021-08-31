# blogsnip

<!-- badges: start -->
[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![R-CMD-check](https://github.com/matt-dray/blogsnip/workflows/R-CMD-check/badge.svg)](https://github.com/matt-dray/blogsnip/actions)
[![Blog post](https://img.shields.io/badge/rostrum.blog-post-008900?labelColor=000000&logo=data%3Aimage%2Fgif%3Bbase64%2CR0lGODlhEAAQAPEAAAAAABWCBAAAAAAAACH5BAlkAAIAIf8LTkVUU0NBUEUyLjADAQAAACwAAAAAEAAQAAAC55QkISIiEoQQQgghRBBCiCAIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAAh%2BQQJZAACACwAAAAAEAAQAAAC55QkIiESIoQQQgghhAhCBCEIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAA7)](https://www.rostrum.blog/2019/10/22/blogsnip/)
<!-- badges: end -->

## What

{blogsnip} is a package of [RStudio addins](https://rstudio.github.io/rstudioaddins/) for inserting code snippets. 

The addins make it easier for me to write [{blogdown}](https://bookdown.org/yihui/blogdown/) posts for [rostrum.blog](https://rostrum.blog). You may or may not find them useful.

You can read about each function in the [vignette](https://matt-dray.github.io/blogsnip/articles/intro.html), on [the 'references' page of the {blogsnip} website](https://matt-dray.github.io/blogsnip/reference/index.html) or [browse the source](https://github.com/matt-dray/blogsnip/blob/master/R/blogsnip-helpers.R).

<div class="figure">
<img src="https://www.rostrum.blog/post/2019-10-22-blogsnip-an-rstudio-addin-package_files/blogsnip.gif" alt="The blogsnip RStudio addin is demonstrated by selecting 'insert details block' from the addins menu, which creates an expandable details section when rendered from R Markdown to HTML." width="400px"/>
<p class="caption">The function `bs_details_expand()` via an RStudio addin</p>
</div>

## Install

Install from GitHub with:

``` r
install.packages("remotes")
remotes::install_github("matt-dray/blogsnip")
```

Restart RStudio and the addins will then be available from the 'Addins' menu in RStudio, listed under 'BLOGSNIP'.

## Contribute

Feel free to [add or suggest new snippets](https://github.com/matt-dray/blogsnip/issues). Please note that the 'blogsnip' project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.
