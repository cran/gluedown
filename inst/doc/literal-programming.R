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

## ----markdown_desc------------------------------------------------------------
markdown_blog <- 
  read_html("https://daringfireball.net/projects/markdown/") %>% 
  html_nodes("p") %>% 
  html_text()

## ----quote_what, results='asis'-----------------------------------------------
md_quote(markdown_blog[4])

## ----quote_why, results='asis'------------------------------------------------
md_quote(markdown_blog[6])

## ----state.name---------------------------------------------------------------
mode(state.name)
length(state.name)
sample(state.name, 3)

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

mode(inlines)
length(inlines)
print(inlines)

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

## ----blockquote, results='asis'-----------------------------------------------
read_html("https://w.wiki/A58") %>% # 1
  html_node("blockquote") %>% # 2
  html_text(trim = TRUE) %>% # 3
  str_remove("\\[(.*)\\]") %>% # 4
  md_quote() # 5

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

