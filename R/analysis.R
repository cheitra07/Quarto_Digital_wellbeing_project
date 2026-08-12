
library(readxl)
library(dplyr)
library(ggplot2)
library(scales)

data_file <- "data/survey_data.xlsx"
raw <- read_excel(data_file, sheet = "survey", skip = 7)
survey <- raw %>% filter(!is.na(student))

answer_labels <- list(
  Q1 = c(A="Less than 1 hour", B="1–2 hours", C="2–4 hours", D="More than 4 hours"),
  Q3 = c(A="Never", B="Rarely", C="Daily for less than 1 hour", D="Daily for more than 1 hour"),
  Q7 = c(A="Never", B="Occasionally", C="Daily for less than 1 hour", D="Daily for more than 1 hour"),
  Q9 = c(A="Never", B="Sometimes", C="Often", D="Every night"),
  Q10 = c(A="Less than 6 hours", B="6–7 hours", C="7–9 hours", D="More than 9 hours"),
  Q11 = c(A="Less than 30 minutes", B="30–60 minutes", C="1–2 hours", D="More than 2 hours"),
  Q13 = c(A="Never", B="Sometimes", C="Often", D="Very often")
)

question_titles <- c(
  Q1="Mobile phone usage", Q3="Social media usage", Q7="Earphone habits",
  Q9="Phone before sleep", Q10="Sleep duration", Q11="Physical activity",
  Q13="Effect of excessive mobile use"
)

make_summary <- function(q) {
  tibble(answer=names(answer_labels[[q]]) |> as.character()) %>%
    mutate(label=unname(answer_labels[[q]][answer])) %>%
    left_join(
      survey %>% count(.data[[q]], name="n") %>% rename(answer=.data[[q]]),
      by="answer"
    ) %>%
    mutate(n=ifelse(is.na(n), 0L, n), percent=ifelse(sum(n) > 0, n/sum(n), 0))
}

plot_question <- function(q) {
  d <- make_summary(q)
  ggplot(d, aes(x=reorder(label,n), y=n, fill=n)) +
    geom_col(show.legend=FALSE) +
    geom_text(aes(label=paste0(n," (",percent(percent,accuracy=.1),")")),
              hjust=-.08, size=3.6) +
    coord_flip() +
    scale_y_continuous(expand=expansion(mult=c(0,.15))) +
    labs(title=question_titles[[q]], x=NULL, y="Students") +
    theme_minimal(base_family="Arial", base_size=12) +
    theme(plot.title=element_text(face="bold",colour="#4B236B"),
          panel.grid.major.y=element_blank())
}
