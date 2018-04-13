page_break <- function(section = NULL){
  if(knitr:::pandoc_to() == "latex") {
    paste("\\newpage \n #", section)
  } else {paste("#####", section)}
}
