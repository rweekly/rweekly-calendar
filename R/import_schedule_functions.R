import_schedule_data <- function(board = NULL) {
  if (is.null(board)) {
    board <- pins::board_s3(
      bucket = "rweekly-misc",
      prefix = "calendar/",
      access_key = Sys.getenv("S3_ACCESS_KEY"),
      secret_access_key = Sys.getenv("S3_SECRET_KEY"),
      endpoint = Sys.getenv("S3_ENDPOINT")
    )
  }
  board |> pins::pin_read("schedule_df")
}

import_curator_data <- function(board = NULL) {
  if (is.null(board)) {
    board <- pins::board_s3(
      bucket = "rweekly-misc",
      prefix = "calendar/",
      access_key = Sys.getenv("S3_ACCESS_KEY"),
      secret_access_key = Sys.getenv("S3_SECRET_KEY"),
      endpoint = Sys.getenv("S3_ENDPOINT")
    )
  }
  board |> pins::pin_read("curator_df")
}
