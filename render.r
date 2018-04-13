
system.time(render("main_text.rmd", "bookdown::word_document2"))
system.time(render("main_text.rmd", "bookdown::pdf_document2"))

system.time(render("SI.rmd", "bookdown::pdf_document2"))
system.time(render("SI.rmd", "bookdown::word_document2"))
