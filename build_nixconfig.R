#https://gist.github.com/b-rodrigues/d427703e76a112847616c864551d96a1
library(rix)

rix(
  date = "2024-12-14",
  project_path = getwd(),
  r_pkgs = c(
    "tibble",
    "lubridate",
    "stringr",
    "dplyr",
    "clock",
    "httr2",
    "jsonlite",
    "openxlsx2",
    "toastui",
    "reactable",
    "quarto",
    "htmltools",
    "purrr"
  ),
  ide = "other",
  overwrite = TRUE
)
