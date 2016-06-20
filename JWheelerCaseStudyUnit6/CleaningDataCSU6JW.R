#####################
##Cleaning the data
####################

#First, take a look at the data
head(GDPdata)
head(Educationdata)

#Get rid of commas in the millionUSdollars column
GDPdata$X.3 <- gsub(",", "", GDPdata$X.3)

##Cleaning up the GDPdata - looks like data needs names and starts on line 6 and ends on line 195, the rest of the countries do not have complete data, including ranking.
#Dataset starts on line 6:
gdpdata <- GDPdata [5:194,]

#Naming the columns:
names(gdpdata) <- c("countrycode", "GDPranking", "empty", "country", "millionsUSdollars", "empty", "empty", "empty", "empty", "empty")

#Count NA's in gdp dataset:
sum(is.na(gdpdata))

#Get rid of empty columns- repeat 6 times:
gdpdata$empty <- NULL
gdpdata$empty <- NULL
gdpdata$empty <- NULL
gdpdata$empty <- NULL
gdpdata$empty <- NULL
gdpdata$empty <- NULL

#Re-check the number of NA's:
sum(is.na(gdpdata))


#shows factors, let's convert important columns as needed:
gdpdata$countrycode <- as.character(gdpdata$countrycode)
gdpdata$millionsUSdollars <- as.numeric(gdpdata$millionsUSdollars)
gdpdata$country <- as.character(gdpdata$country)


#Let's create a new object for education data so that we can backtrack to the originally downloaded file if we need to:
educationdata <- Educationdata

#Change all names in education dataset to lower case:
names(educationdata) <- tolower(names(educationdata))

#Convert important columns from factors in educationdata:
educationdata$countrycode <- as.character(educationdata$countrycode)
educationdata$income.group <- as.character(educationdata$income.group)


