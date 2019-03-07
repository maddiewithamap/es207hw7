sans<-c("Santa", "San")
san_match<-str_c(sans, collapse="|")

has_sans<-str_subset(loc$`Site Name`, san_match)
has_sans