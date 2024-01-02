process_cal_data <- function(cal_df, year = 2024) {
  curator_df <- create_curator_df()

  processed_cal_df <- cal_df |>
    mutate(
      backup_flag = stringr::str_detect(SUMMARY, "^BACKUP"),
      year = lubridate::year(`DTSTART;VALUE=DATE`),
      category = "allday"
    ) |>
    filter(year == !!year) |>
    select(
      name = CATEGORIES,
      backup_flag,
      year,
      title = SUMMARY,
      start = `DTSTART;VALUE=DATE`,
      end = `DTEND;VALUE=DATE`,
      backgroundColor = COLOR,
      category
    ) |>
    mutate(
      color = case_when(
        backgroundColor %in% c("midnightblue", "purple", "steelblue", "indianred") ~ "white",
        TRUE ~ NA_character_
      )
    ) |>
    arrange(start)

  return(processed_cal_df)
}