# blogsnip

<!-- badges: start -->
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Blog post](https://img.shields.io/badge/rostrum.blog-post-008900?labelColor=000000&logo=data%3Aimage%2Fgif%3Bbase64%2CR0lGODlhEAAQAPEAAAAAABWCBAAAAAAAACH5BAlkAAIAIf8LTkVUU0NBUEUyLjADAQAAACwAAAAAEAAQAAAC55QkISIiEoQQQgghRBBCiCAIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAAh%2BQQJZAACACwAAAAAEAAQAAAC55QkIiESIoQQQgghhAhCBCEIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAA7)](https://www.rostrum.blog/2019/10/22/blogsnip/)
<!-- badges: end -->

<img src="https://www.rostrum.blog/post/2019-10-22-blogsnip-an-rstudio-addin-package_files/blogsnip.gif" alt="The blogsnip addin is demonstrated by selecting 'insert details block' from the addins menu, which creates an expandable details section when rendered from R Markdown to HTML.">

## What

{blogsnip} is a package of [RStudio addins](https://rstudio.github.io/rstudioaddins/) for inserting code snippets into [{blogdown}](https://bookdown.org/yihui/blogdown/) posts.

These snippets make my life easier when writing R Markdown blog posts for [rostrum.blog](https://rostrum.blog). You may or may not find them useful. The package will be updated over time with new addins as I see fit.

You can read about each function in the [vignette](https://matt-dray.github.io/blogsnip/articles/intro.html), on [the 'references' page of the {blogsnip} website](https://matt-dray.github.io/blogsnip/reference/index.html) or [browse the source](https://github.com/matt-dray/blogsnip/blob/master/R/blogsnip-helpers.R).

## Install

Install with:

```
install.packages("remotes")
remotes::install_github("matt-dray/blogsnip")
```

The addins will then be available from the 'Addins' menu in RStudio, listed under 'BLOGSNIP'.

## Contribute

Feel free to [add or suggest new snippets](https://github.com/matt-dray/blogsnip/issues). 

Please note that the 'blogsnip' project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.
