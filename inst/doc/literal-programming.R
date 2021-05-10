## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----libraries, warning=FALSE, message=FALSE, error=FALSE---------------------
library(gluedown)
library(stringr)
library(rvest)
library(glue)

## ----markdown_desc, eval=FALSE------------------------------------------------
#  markdown_blog <-
#    read_html("https://daringfireball.net/projects/markdown/") %>%
#    html_elements("p") %>%
#    html_text()

## ----echo=FALSE---------------------------------------------------------------
x <- tryCatch(
  expr = read_html("https://daringfireball.net/projects/markdown/"),
  error = function(e) NULL
)
if (!is.null(x)) {
 markdown_blog <- html_text(html_elements(x, "p"))
} else {
  markdown_blog <- LETTERS
}

## ----quote_what, results='asis'-----------------------------------------------
md_quote(markdown_blog[4])

## ----quote_why, results='asis'------------------------------------------------
md_quote(markdown_blog[6])

## ----state.name---------------------------------------------------------------
str(state.name, vec.len = 3)

## ----cat_plain, results='asis'------------------------------------------------
cat(state.name[1:3])

## ----cat_newline, results='asis'----------------------------------------------
cat(state.name[1:3], sep = "\n\n")

## ----cat_order, results='asis'------------------------------------------------
cat(paste0(1:3, ". ", state.name[1:3]), sep = "\n")

## ----glue_order, results='asis'-----------------------------------------------
glue("{1:3}. {state.name[1:3]}")

## ----order_list_raw-----------------------------------------------------------
# markdown only cares about the first number
md_order(state.name[1:3], seq = FALSE)
# markdown ignored padding and allows for use of parentheses
md_order(state.name[1:10], seq = TRUE, pad = TRUE, marker = ")")

## ----order_list_pretty, results='asis'----------------------------------------
md_order(state.name[1:3], seq = FALSE)
md_order(state.name[1:10], seq = TRUE, pad = TRUE, marker = ")")

## ----inline_vector------------------------------------------------------------
inlines <- c(
  md_bold(state.name[4]),
  md_code(state.name[5]),
  md_link(state.name[6], "https://Colorado.gov"),
  md_italic(state.name[7]),
  md_strike(state.name[8])
)

str(inlines, vec.len = 3)

## ----bullet_list, results='asis'----------------------------------------------
md_bullet(inlines)

## ----theme_break, results='asis'----------------------------------------------
md_rule(char = "*", n = 80)

## ----fence_block, results='asis'----------------------------------------------
lines <- deparse(md_bullet)
md_fence(lines)

## ----tilde_block--------------------------------------------------------------
command <- "sudo apt install r-base-dev"
md_fence(paste("$", command), char = "~", info = "bash")

## ----blockquote, results='asis', eval=FALSE-----------------------------------
#  read_html("https://w.wiki/A58") %>% # 1
#    html_element("blockquote") %>%    # 2
#    html_text(trim = TRUE) %>%        # 3
#    str_remove("\\[(.*)\\]") %>%      # 4
#    md_quote()                        # 5

## ----results='asis', echo=FALSE-----------------------------------------------
w <- "https://en.wikipedia.org/wiki/Preamble_to_the_United_States_Constitution"
x <- tryCatch(
  expr = read_html(w),
  error = function(e) NULL
)
if (!is.null(x)) {
  x %>%
    html_element("blockquote") %>%
    html_text(trim = TRUE) %>%
    str_remove("\\[(.*)\\]") %>%
    md_quote() 
}  

## ----ex_task, results='asis'--------------------------------------------------
legislation <- c("Houses passes", "Senate concurs", "President signs")
md_task(legislation, check = 1:2)

## ----print_mass---------------------------------------------------------------
print(head(state.x77))

## ----table_mass, results='asis'-----------------------------------------------
md_table(head(state.x77), digits = 2)

## ----ex_inline----------------------------------------------------------------
rand <- sample(state.name, 1)
# `r md_bold(rand)`
var <- sample(colnames(state.x77), 1)
# `r md_code(var)`

