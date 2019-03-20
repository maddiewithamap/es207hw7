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



# comments from Toshi
# how about deducting the number of sites with correct zip code and address
# that would be the number of sites with incomplete address or zipcode.

#extract the Address column as a vector
Address <- pull(loc,"Address")
#extract the Zip Code column as a vector
ZipCode <- pull(loc,"Zip Code")

#The number of sites that do not have a complete address
length(Address) - sum(str_detect(Address, "\\d") & str_detect(ZipCode, "^\\d{5}"), na.rm = TRUE)