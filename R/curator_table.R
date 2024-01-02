curator_table <- function(cal_df) {
  curator_df <- create_curator_df()

  # primary curator set
  df1 <- processed_cal_data |>
    filter(!backup_flag) |>
    rename(primary_curator = name) |>
    mutate(issue_index = row_number()) |>
    select(-backup_flag) |>
    left_join(
      select(curator_df, primary_curator = name, primary_picture = picture),
      by = "primary_curator"
    )

  # backup curator set
  df2 <- processed_cal_data |>
    filter(backup_flag) |>
    rename(backup_curator = name) |>
    mutate(issue_index = row_number()) |>
    select(issue_index, backup_curator) |>
    left_join(
      select(curator_df, backup_curator = name, backup_picture = picture),
      by = "backup_curator"
    )

  # combine and do final processing
  df <- left_join(df1, df2, by = "issue_index") |>
    mutate(issue = glue::glue("{year}-W{stringr::str_pad(issue_index, width = 2, side = 'left', pad = '0')}")) |>
    select(issue, start, end, primary_curator, primary_picture, backup_curator, backup_picture)

  # df <- processed_cal_data |>
  #   left_join(curator_df, by = "name") |>
  #   mutate(role = case_when(
  #     backup_flag ~ "backup",
  #     TRUE ~ "primary"
  #   )) |>
  #   select(picture, name, role, start, end, year) |>
  #   group_by(start, end) |>
  #   mutate(issue_index = cur_group_id()) |>
  #   ungroup() |>
  #   mutate(issue = glue::glue("{year}-W{stringr::str_pad(issue_index, width = 2, side = 'left', pad = '0')}"))
    #pivot_wider(names_from = role, values_from = name)

  # define reactable
  tbl <- reactable(
    df,
    columns = list(
      issue = colDef(name = "Issue"),
      start = colDef(name = "Start"),
      end = colDef(name = "End"),
      primary_curator = colDef(
        name = "Curator",
        cell = function(value, index) {
          pic <- df$primary_picture[index]
          div(
            style = "display: flex; align-items: center;",
            img(class = "imageclass", alt = value, src = pic),
            value
          )
        }
      ),
      primary_picture = colDef(show = FALSE),
      backup_curator = colDef(
        name = "Backup",
        cell = function(value, index) {
          pic <- df$backup_picture[index]
          div(
            class = "namecolumn",
            img(class = "imageclass", alt = value, src = pic),
            value
          )
        }
      ),
      backup_picture = colDef(show = FALSE)
    )
  )

  return(tbl)
}