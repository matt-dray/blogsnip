# blogsnip

<!-- badges: start -->
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![R-CMD-check](https://github.com/matt-dray/blogsnip/workflows/R-CMD-check/badge.svg)](https://github.com/matt-dray/blogsnip/actions)
[![Blog post](https://img.shields.io/badge/rostrum.blog-post-008900?labelColor=000000&logo=data%3Aimage%2Fgif%3Bbase64%2CR0lGODlhEAAQAPEAAAAAABWCBAAAAAAAACH5BAlkAAIAIf8LTkVUU0NBUEUyLjADAQAAACwAAAAAEAAQAAAC55QkISIiEoQQQgghRBBCiCAIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAAh%2BQQJZAACACwAAAAAEAAQAAAC55QkIiESIoQQQgghhAhCBCEIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAA7)](https://www.rostrum.blog/2019/10/22/blogsnip/)
<!-- badges: end -->

## What

{blogsnip} is a package of miscellaneous [RStudio addins](https://rstudio.github.io/rstudioaddins/) to insert code snippets and update code selections.

In general, the addins make it easier for me to write R Markdown posts for the [{blogdown}](https://bookdown.org/yihui/blogdown/)-powered [rostrum.blog](https://rostrum.blog) site. You may or may not find them useful.

Consider also the excellent [{remedy} package](https://thinkr-open.github.io/remedy/) from ThinkR, which has a number of general RStudio addins to help you write R Markdown.

<div class="figure">
<img src="https://www.rostrum.blog/post/2019-10-22-blogsnip-an-rstudio-addin-package_files/blogsnip.gif" alt="The blogsnip RStudio addin is demonstrated by selecting 'insert details block' from the addins menu, which creates an expandable details section when rendered from R Markdown to HTML." width="400px"/>
</div>

You can read about each function in the [vignette](https://matt-dray.github.io/blogsnip/articles/intro.html), on [the 'references' page of the {blogsnip} website](https://matt-dray.github.io/blogsnip/reference/index.html) or [browse the source](https://github.com/matt-dray/blogsnip/blob/master/R/blogsnip-helpers.R).

## Install

Install from GitHub with:

``` r
install.packages("remotes")  # if not yet installed
remotes::install_github("matt-dray/blogsnip")
```

Restart RStudio and the addins will then be available from the 'Addins' menu in RStudio, listed under 'BLOGSNIP'.

If you want to use 'Add Closing Paren Labels', the addin for the `bs_add_biscuits()`, you'll also need to install {styler} from CRAN.

``` r
install.packages("styler")
```

## Contribute

Feel free to [add or suggest new snippets](https://github.com/matt-dray/blogsnip/issues). 

Please note that the 'blogsnip' project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.
