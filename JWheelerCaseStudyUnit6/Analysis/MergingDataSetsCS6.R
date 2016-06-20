##########################
##Merging the datasets
#########################

#Merge by countrycode, which is each country's shortcode:
MergeData1 <- merge(x=gdpdata, y=educationdata, by="countrycode", all=TRUE, sort=FALSE)

#Check NA's:
sum(is.na(MergeData1))

#Create a new object to work with that contains the columns we need:
merged <- MergeData1[, 1:6]

#Check NA's:
sum(is.na(merged))