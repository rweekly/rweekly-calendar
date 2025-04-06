create_schedule_table <- function(schedule_df, curator_df) {
  # primary curator set
  df1 <- schedule_df|>
    dplyr::select(-backup) |>
    dplyr::rename(primary_curator = curator) |>
    dplyr::left_join(
      dplyr::select(curator_df, primary_curator = real_name, primary_picture = image_32),
      by = "primary_curator"
    ) |>
    dplyr::select(issue_id, from, to, primary_curator, primary_picture)

  # backup curator set
  df2 <- schedule_df|>
    dplyr::select(-curator) |>
    dplyr::rename(backup_curator = backup) |>
    dplyr::left_join(
      dplyr::select(curator_df, backup_curator = real_name, backup_picture = image_32),
      by = "backup_curator"
    ) |>
    dplyr::select(issue_id, backup_curator, backup_picture)

  # combine and do final processing
  df <- dplyr::left_join(df1, df2, by = "issue_id") |>
    dplyr::select(issue_id, start = from, end = to, primary_curator, primary_picture, backup_curator, backup_picture)

  # define reactable
  tbl <- reactable::reactable(
    df,
    columns = list(
      issue_id = reactable::colDef(name = "Issue"),
      start = reactable::colDef(name = "Start"),
      end = reactable::colDef(name = "End"),
      primary_curator = reactable::colDef(
        name = "Curator",
        cell = function(value, index) {
          pic <- df$primary_picture[index]
          htmltools::div(
            class = "sidebar-title",
            htmltools::tags$img(src = pic, alt = "User Picture", class = "profile-pic"),
            htmltools::span(
              class = "welcome-text",
              value
            )
          )
        }
      ),
      primary_picture = reactable::colDef(show = FALSE),
      backup_curator = reactable::colDef(
        name = "Backup",
        cell = function(value, index) {
          pic <- df$backup_picture[index]
          htmltools::div(
            class = "sidebar-title",
            htmltools::tags$img(src = pic, alt = "User Picture", class = "profile-pic"),
            htmltools::span(
              class = "welcome-text",
              value
            )
          )
        }
      ),
      backup_picture = reactable::colDef(show = FALSE)
    ),
    defaultColDef = reactable::colDef(vAlign = "center"),
    defaultPageSize = 5,
    showPageSizeOptions = TRUE,
    pageSizeOptions = c(5, 10, 20),
    selection = "single"
  )

  return(tbl)
}