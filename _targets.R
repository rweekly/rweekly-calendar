# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline

# Load packages required to define the pipeline:
library(targets)
library(tarchetypes)

# Set target options:
tar_option_set(
  packages = c("caldav", "calendar", "tibble", "dplyr", "lubridate", "stringr", "gh") # packages that your targets need to run
)

# Run the R scripts in the R/ folder with your custom functions:
tar_source()

# Replace the target list below with your own:
list(
  # import raw ics calendar data
  tar_age(
    cal_data,
    get_cal_data(),
    age = as.difftime(3, units = "days")
  ),
  # obtain number of rweekly issues
  tar_age(
    rweekly_issue_count,
    get_issue_count(),
    age = as.difftime(3, units = "days")
  ),
  # create processed calendar data
  tar_target(
    processed_cal_data,
    process_cal_data(cal_data)
  )
)
