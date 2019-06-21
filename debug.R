
library(devtools)
library(magrittr)

document()
check()
install("./")

library(gitlabr)

my_gitlab <- gl_connection("https://gitlab.spectrumxg.com", private_token = readLines("~/.gitlab.credentials"))
# my_gitlab("projects", pages = 2)
mine_issues <- my_gitlab(c("groups", 1712, "issues"))

mine_issues %>% 
  mutate_at()


  