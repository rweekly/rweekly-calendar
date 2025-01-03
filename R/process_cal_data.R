process_cal_data <- function(cal_df) {
  # initalize curator data frame
  curator_df <- create_curator_df() |>
    dplyr::select(curator = name, calendar_color, name_color)

  # prepare primary curator schedule
  processed_cal_df <- cal_df |>
    dplyr::left_join(curator_df, by = "curator") |>
    dplyr::mutate(
      calendarId = 1,
      title = glue::glue("{issue_id} ({curator})"),
      body = glue::glue("Backup curator: {backup}"),
      category = "allday"
    ) |>
    dplyr::select(
      calendarId,
      title,
      body,
      start = from,
      end = to,
      category,
      backgroundColor = calendar_color,
      color = name_color
    ) |>
    dplyr::arrange(start)

  return(processed_cal_df)
}