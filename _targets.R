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
  xlsform_file = download_googledrive(
    filename = "rrr_feedback", 
    path = "forms/rrr_feedback.xlsx", 
    overwrite = TRUE
  )
)

## Read raw data
raw_data <- tar_plan(
  ##
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