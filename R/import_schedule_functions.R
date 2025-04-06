import_schedule_data <- function(
  query = "SELECT * FROM schedule",
  from_owner = "rweekly-org",
  from_repo_name = "curation-schedule"
) {

  result_raw <- httr2::request("https://www.dolthub.com") |>
  httr2::req_url_path_append(
    "api",
    "v1alpha1",
    from_owner,
    from_repo_name
  ) |>
    httr2::req_url_query(
      q = query
    ) |>
    httr2::req_perform()

  result_json <- httr2::resp_body_json(result_raw)

  result_df <- purrr::map_df(
    purrr::pluck(result_json, "rows"),
    ~{
      data_row <- purrr::map_depth(.x, 1, ~ifelse(is.null(.x), NA, .x))
      return(tibble::as_tibble_row(data_row))
    }
  ) |>
    dplyr::mutate(
      issue_index = as.numeric(issue_index),
      from = as.Date(from),
      to = as.Date(to)
    )
  return(result_df)
}

import_curator_data <- function(query = "SELECT * FROM curator_df") {

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
  ) 
  return(result_df)

}
