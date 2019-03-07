library(tidyverse, quietly = TRUE)
library(readr, quietly= TRUE)
setwd("C:\\Users\\maddi\\OneDrive\\Desktop\\Spring2019\\ES207\\Assignments")
o3.filenames<-list.files("Assignment4IndividualCode\\ca_ozone", pattern=".txt")
o3.filenames
setwd("C:\\Users\\maddi\\OneDrive\\Desktop\\Spring2019\\ES207\\Assignments\\Assignment4IndividualCode\\ca_ozone")
o3.filelist<-lapply(o3.filenames, read_delim, delim = "|")
names(o3.filelist) <- gsub(".txt","", o3.filenames)
o3.filelist

library(data.table)
daily <- o3.filelist %>%
  rbindlist() %>%
  group_by(site = as.factor(site), date) %>%
  summarize(o3 = mean(obs, na.rm = TRUE))
daily

library(tidyverse)
library(readxl)
setwd("C:\\Users\\maddi\\OneDrive\\Desktop\\Spring2019\\ES207\\Assignments")
loc <- read_excel("Assignment4IndividualCode\\ca_ozone\\location.xls")
loc

colnames(loc)[1] <- "site"
daily.site <- daily %>%
  left_join(loc, by = "site")

mbfun<-function(x)  {
  annfun<-filter(x, 'Site Name', str_detect("Santa"|"San"))
  annfun%>%
    group_by('Site Name', as.factor(date)) %>%
    summarize(mean(o3, na.rm=TRUE),
              median(o3, na.rm=TRUE), 
              max(o3, na.rm=TRUE),
              min(o3, na.rm=TRUE)
    )
}

mbfun(daily.site)