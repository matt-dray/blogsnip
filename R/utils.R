.parse <- function(string) {
  
  file <- tempfile(fileext = ".R")
  writeLines(string, file)
  
  parsed <- getParseData(parse(file))  
  parsed <- parsed[parsed$terminal == TRUE, ]
  rownames(parsed) <- as.character(seq(nrow(parsed)))
  
  return(parsed)
  
}

.label <- function(tree) {
  
  tree$label <- NA_character_
  
  for (tkn in seq_len(nrow(tree))) {
    
    tree$label[tkn] <- ifelse(
      tree$token[[tkn]] == "')'",
      tree[as.numeric(rownames(
        tree[tree$parent == tree$parent[[tkn]] & tree$token == "'('", ]
      )) - 1, "text"],
      NA_character_
    )
    
  }
  
  return(tree)
  
}

.format <- function(tree_lbl) {
  
  tree_lbl$comma <- c(
    ifelse(tree_lbl$text != ",", NA_character_, ",")[-1], NA_character_
  )  # lag commas
  
  tree_lbl <- tree_lbl[tree_lbl$token != "','", ]  # remove comma tokens
  
  tree_lbl$string <- NA_character_
  
  for (tkn in seq_len(nrow(tree_lbl))) {
    
    if (!is.na(tree_lbl$comma[tkn])) {  # when there's a comma
      
      if (!is.na(tree_lbl$label[tkn])) {  # paste with biscuit
        
        tree_lbl$string[tkn] <- paste0(
          "\n", tree_lbl$text[tkn], tree_lbl$comma[tkn],
          "#", tree_lbl$label[tkn], "\n"
        ) 
        
      } else if (is.na(tree_lbl$label[tkn])) {  # paste without biscuit
        
        tree_lbl$string[tkn] <- paste0(
          "\n", tree_lbl$text[tkn], tree_lbl$comma[tkn], "\n"
        ) 
        
      }
      
    } else if (is.na(tree_lbl$comma[tkn]) & !is.na(tree_lbl$label[tkn])) {
      
      tree_lbl$string[tkn] <- paste0(
        "\n", tree_lbl$text[tkn], "#", tree_lbl$label[tkn], "\n"
      ) 
      
    } else {  # no comma, no biscuit
      
      tree_lbl$string[tkn] <- tree_lbl$text[tkn]
      
    }
    
  }
  
  string_out <- paste0(tree_lbl$string, collapse = "")
  string_out <- gsub("\n\n", "\n", string_out)
  
  styled <- suppressWarnings(
    utils::capture.output(styler::style_text(string_out))
  )
  
  paste(styled, collapse = "\n")
  
}

.add_biscuits <- function(string) { 
  
  .format(.label(.parse(string)))
  
}