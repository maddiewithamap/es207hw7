extract<-str_subset(loc$`Zip Code`, "[0-9][0-9][0-9][0-9][0-9]", negate=TRUE)
str_count(extract)
#this is just returning the number of digits in each non-
#this works to return non-matching zips, but doesnt account for NAs...how to find NAs?
#extractNA<-str_subset(loc$`Zip Code`, as.vector("NA"), negate=FALSE)
#other way to view as table with 0 non-match, 1 match, and NAs

nonzip<-str_count(loc$`Zip Code`, "^[0-9][0-9][0-9][0-9][0-9]")

approx<-str_subset(loc$Address, "Location Approximate", negate =FALSE)
notknown<-str_subset(loc$Address, "Address Not Known", negate=FALSE)
na<-str_subset(loc$Address, "NA", negate=FALSE)