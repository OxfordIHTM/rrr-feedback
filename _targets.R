################################################################################
#
# Project build script
#
################################################################################

# Load packages (in packages.R) and load project-specific functions in R folder
suppressPackageStartupMessages(source("packages.R"))
for (f in list.files(here::here("R"), full.names = TRUE)) source (f)


# Set build options ------------------------------------------------------------



# Groups of targets ------------------------------------------------------------

## Get XLSForm and setup ODK in ONA
xlsform_setup <- tar_plan(
  tar_target(
    name = xlsform_file,
    command = download_googledrive(
      filename = "rrr_feedback", 
      path = "forms/rrr_feedback.xlsx", 
      overwrite = TRUE
    ) |>
      (\(x) x[["local_path"]])(),
    format = "file"
  ),
  ona_project_id = okapi::ona_project_list() |>
    subset(name == "Open Science and Reproducible Research in R") |>
    (\(x) x[["projectid"]])(),
  ona_form_published = okapi::ona_form_publish(
    xls_file = xlsform_file,
    project_id = ona_project_id,
    public = TRUE
  )
)

## Read raw data
raw_data <- tar_plan(
  ##
  feedback_data = okapi::ona_data_list() |>
    subset(id_string == "rrr_feedback") |>
    (\(x) x[["id"]])() |>
    (\(x) okapi::ona_data_get(form_id = x))()
)


## Process data
processed_data <- tar_plan(
  ##
)


## Analysis
analysis <- tar_plan(
  ##
)


## Outputs
outputs <- tar_plan(
  ##
)


## Reports
reports <- tar_plan(
  ##
)

## Deploy targets
deploy <- tar_plan(
  ##
)

## Set seed
set.seed(1977)

# Concatenate targets ----------------------------------------------------------
list(
  xlsform_setup,
  raw_data,
  processed_data,
  analysis,
  outputs,
  reports,
  deploy
)