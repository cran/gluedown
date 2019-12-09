## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, warning=FALSE, message=FALSE--------------------------------------
library(gluedown)
library(stringr)
library(rvest)

## -----------------------------------------------------------------------------
md_rule()

## ----echo=FALSE, results='asis'-----------------------------------------------
md_rule()

## -----------------------------------------------------------------------------
md_rule(char = "-", n = 10, space = TRUE)

## ----echo=FALSE, results='asis'-----------------------------------------------
md_rule(char = "-", n = 10, space = TRUE)

## ----echo=FALSE, results='asis'-----------------------------------------------
md_heading("4.2 ATX Headings", level = 3)

## -----------------------------------------------------------------------------
md_heading("4.2 ATX Headings", level = 3)

## -----------------------------------------------------------------------------
md_setext("Headings", level = 1)

## -----------------------------------------------------------------------------
md_setext("4.3 Setext headings", level = 2)

## -----------------------------------------------------------------------------
md_setext("4.3 Setext headings", width = 50)

## -----------------------------------------------------------------------------
rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}

# use deparse() to turn unevaluated expressions into character strings.
source <- deparse(rescale01)
# this new object is a regular character vector
print(source)

## -----------------------------------------------------------------------------
md_indent(source)

## ----echo=FALSE, results='asis'-----------------------------------------------
md_indent(source)

## -----------------------------------------------------------------------------
md_fence(source)

## ----echo=FALSE, results='asis'-----------------------------------------------
md_fence(source)

## -----------------------------------------------------------------------------
md_fence(source, char = "~")

## ----echo=FALSE, results='asis'-----------------------------------------------
md_fence(source, char = "~")

## -----------------------------------------------------------------------------
md_fence("$ sudo apt install r-base-dev", info = "bash")

## ----echo=FALSE, results='asis'-----------------------------------------------
md_fence("$ sudo apt install r-base-dev", info = "bash")

## -----------------------------------------------------------------------------
read_html("https://example.com/") %>% 
  html_nodes("p") %>%
  md_text()

## ----echo=FALSE, results='asis'-----------------------------------------------
read_html("https://example.com/") %>% 
  html_nodes("p") %>%
  md_text()

## -----------------------------------------------------------------------------
a <- c("cran", "tidy")
b <- c("https://cran.r-project.org/", "https://www.tidyverse.org/")
c <- c("CRAN Home", "Tidyverse Home")

## -----------------------------------------------------------------------------
md_reference(label = a, url = b, title = c)

## ----echo=FALSE, results='asis'-----------------------------------------------
md_reference(label = a, url = b, title = c)

## -----------------------------------------------------------------------------
sentences <- sample(stringr::sentences, size = 5)

## -----------------------------------------------------------------------------
md_paragraph(sentences)

## ----echo=FALSE, results='asis'-----------------------------------------------
md_paragraph(sentences)

## -----------------------------------------------------------------------------
md_blank()

## ----echo=FALSE, results='asis'-----------------------------------------------
md_blank()

## ----message=FALSE, warning=FALSE---------------------------------------------
states <- head(state.x77)
print(states)

## -----------------------------------------------------------------------------
options(knitr.kable.NA = "")
md_table(states, align = "c")

## ----echo=FALSE, results='asis'-----------------------------------------------
options(knitr.kable.NA = "")
md_table(states, align = "c")

## -----------------------------------------------------------------------------
read_html("https://w.wiki/A58") %>% 
  html_node("blockquote") %>% 
  html_text(trim = TRUE) %>% 
  str_remove("\\[(.*)\\]") %>% 
  md_quote()

## ----echo=FALSE, results='asis'-----------------------------------------------
read_html("https://w.wiki/A58") %>% 
  html_node("blockquote") %>% 
  html_text(trim = TRUE) %>% 
  str_remove("\\[(.*)\\]") %>% 
  md_quote()

## -----------------------------------------------------------------------------
md_quote(sentences)

## ----echo=FALSE, results='asis'-----------------------------------------------
md_paragraph(md_quote(sentences))

## -----------------------------------------------------------------------------
md_task(sentences, check = 3:4)

## ----echo=FALSE, results='asis'-----------------------------------------------
md_task(sentences, check = 3:4)

## -----------------------------------------------------------------------------
states <- sample(state.name, size = 3)

## -----------------------------------------------------------------------------
md_bullet(states)

## ----echo=FALSE, results='asis'-----------------------------------------------
md_bullet(states)

## -----------------------------------------------------------------------------
md_bullet(states, marker = "+")

## ----echo=FALSE, results='asis'-----------------------------------------------
md_bullet(states, marker = "+")

## -----------------------------------------------------------------------------
md_order(states)

## ----echo=FALSE, results='asis'-----------------------------------------------
md_order(states)

## -----------------------------------------------------------------------------
md_order(states, seq = FALSE, marker = ")")

## ----echo=FALSE, results='asis'-----------------------------------------------
md_order(states, seq = FALSE, marker = ")")

## -----------------------------------------------------------------------------
inline <- md_bold("example")
md_escape(inline)

## ----echo=FALSE, results='asis'-----------------------------------------------
md_escape(inline)

## -----------------------------------------------------------------------------
inlines <- c(
  md_code("6.3 Code spans"),
  md_italic("6.4 Emphasis"),
  md_bold("6.4 Strong emphasis"),
  md_strike("6.5 Strikethrough (extension)"),
  md_link("6.6 Links", "https://example.com/"),
  md_autolink("https://example.com/")
)

## -----------------------------------------------------------------------------
md_bullet(inlines, marker = "-")

## ----echo=FALSE, results='asis'-----------------------------------------------
md_bullet(inlines, marker = "-")

## -----------------------------------------------------------------------------
md_image("https://www.r-project.org/Rlogo.png", alt = "R logo")

## ----echo=FALSE, results='asis'-----------------------------------------------
md_image("https://www.r-project.org/Rlogo.png", alt = "R logo")

## -----------------------------------------------------------------------------
# 6.12 Hard line breaks
md_hardline(sentences)

## ----echo=FALSE, results='asis'-----------------------------------------------
md_hardline(sentences)

## -----------------------------------------------------------------------------
# 6.13 Soft line breaks
md_softline(sentences)

## ----echo=FALSE, results='asis'-----------------------------------------------
md_softline(sentences)

## -----------------------------------------------------------------------------
md_paragraph(sentences)

## ----echo=FALSE, results='asis'-----------------------------------------------
md_paragraph(sentences)

## -----------------------------------------------------------------------------
# 6.14 Textual content
md_text(sentences)

## ----echo=FALSE, results='asis'-----------------------------------------------
md_text(sentences)

## -----------------------------------------------------------------------------
print(sentences)

## ----echo=FALSE, results='asis'-----------------------------------------------
print(sentences)

## -----------------------------------------------------------------------------
cat(sentences)

## ----echo=FALSE, results='asis'-----------------------------------------------
cat(sentences)

