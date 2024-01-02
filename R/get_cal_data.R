get_cal_data <- function() {
  cal_data <-
    caldav::caldav_get_all_simple_auth(
      url = Sys.getenv("CALDAV_URL"),
      user = Sys.getenv("NEXTCLOUD_USER"),
      password =  Sys.getenv("NEXTCLOUD_PASSWORD")
    )
  
  tmpfile <- tempfile(fileext = ".ics")
  cat(cal_data$calendar, file = tmpfile)

  ics_contents <- calendar::ic_read(tmpfile)
  calendar_df <- calendar::ic_dataframe(ics_contents)

  return(calendar_df)
}