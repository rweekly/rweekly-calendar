import_schedule_data <- function(query = "SELECT * FROM schedule") {
  result_raw <- httr2::request("https://www.dolthub.com") |>
    httr2::req_url_path_append(
      "api",
      "v1alpha1",
      "rweekly-org",
      "curation-schedule"
    ) |>
      httr2::req_url_query(
        q = query
      ) |>
      httr2::req_perform()
  
  result_json <- httr2::resp_body_json(result_raw)

  result_df <- purrr::map_df(
    purrr::pluck(result_json, "rows"),
    ~tibble::as_tibble_row(.x)
  ) |>
    dplyr::mutate(issue_index = as.numeric(issue_index)) |>
    dplyr::arrange(issue_index)
  return(result_df)
}
