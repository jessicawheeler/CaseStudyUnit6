###########################
##Loading the data into R
###########################


#Required packages:
require("repmis")
require("dplyr")
require("ggplot2")

#Loading the data
site1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
site2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(site1, destfile="./GDP.csv")
download.file(site2, destfile="./Education.csv")

GDPdata <- read.csv("/Users/JessicaSibal/Desktop/SMU/DataScience/Unit6CaseStudy/JWheelerCaseStudyUnit6/Data/GDP.csv", header=TRUE)
Educationdata <- read.csv("/Users/JessicaSibal/Desktop/SMU/DataScience/Unit6CaseStudy/JWheelerCaseStudyUnit6/Data/Education.csv", header=TRUE)
