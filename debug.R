################################################################################
# Testing the Gitlab API package
#
# Notes:
#   - API documentation https://docs.gitlab.com/ee/api/
#   - Save gitlab credentials here: ~/.gitlab.credentials
#      - your credentials are just a one line string PAT created here: 
#        https://gitlab.spectrumxg.com/profile/personal_access_tokens
################################################################################


# Packages
library(remotes)
library(magrittr)
library(tidyverse)
# library(git2r)


# Functions used in debugging & rebuilding pkgs
# library(devtools)
# document()
# check()
# install("./")



# Load gitlab api package
install_github("mmulvahill/gitlabr", ref = "fix_duplicate_colnames_error")
library(gitlabr)


# Data Science group has a group ID number of:
data_science_grp <- 1712

# Create connection
my_gitlab <- gl_connection("https://gitlab.spectrumxg.com", private_token = readLines("~/.gitlab.credentials"))

# Grab all issues for a group (first vector arg specifies API path - https://docs.gitlab.com/ee/api/)
ds_issues <- my_gitlab(c("groups", data_science_grp, "issues"))

# mine_issues %>% 
#   mutate_at()

ds_members <- my_gitlab(c("groups", data_science_grp, "members"))

ds_members %>% print(n = 100)

ds_members %>% filter(!(username %in% c("gsureddi", "marjorie.truitt", "Ilchenko", "SFields")))

# events <- my_gitlab(c("groups", data_science_grp, "events"))

# Data science boards
boards <- my_gitlab(c("groups", data_science_grp, "boards"))
  
boards %>% dplyr::filter(., name == "Credential Sharing") %>% dplyr::select(dplyr::contains("lists.label.nam"))


boards %>% dplyr::filter(., name == "Credential Sharing") %>% dplyr::select(dplyr::contains("lists.label.nam"))



