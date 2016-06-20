################
##This is scratch for trying to answer the questions.  
##Actual R code used that worked is in the RMarkdown file.
#################



#######################
##Question 1
########################

#Alternative method?





##########################
##Question 3
##########################
hioecd <- merged[which(merged$income.group=='High income: OECD'),]
hinonoecd <- merged[which(merged$income.group=='High income: nonOECD'),]
hinonoecd2 <- na.omit(hinonoecd)

#Find the average ranking for each group.
#When I try to use the mean function, it returns as an error that GDPranking is not numeric and it has to 
#be for this function.  When I tried to convert it to a numeric before merging, 
#somehow the rankings got out of order after merging so I had left it as a factor.  
#But now in order to find more information such as mean, I will convert it to a numeric:

hioecd$GDPranking <- as.numeric(hioecd$GDPranking)
hinonoecd2$GDPranking <- as.numeric(hinonoecd2$GDPranking)

oecdrank <- hioecd[,2]
nonoecdrank <-hinonoecd2[,2]

mean(oecdrank)
mean(nonoecdrank)


###############
##Question 4
##############
#Let's create a subset of GDP ranking and country name:
countryrank <- merged

#Check of NA's and get rid of them:
sum(is.na(countryrank))
countryrank <-na.omit(countryrank)

#Creating the basic plot:
plot <- ggplot(countryrank, aes(countrycode, GDPranking, color=factor(income.group)))+geom_point()
#Title for the plot:
p <- plot+ggtitle('GDP Ranking for all countries, colored by Income Group')
#Turn off the legend title
p+theme(legend.title=element_blank())
p+theme(axis.text.x=element_text(angle=50, size=10, vjust=0.5))


#WORK ON THIS:
p + scale_y_continuous(limits=c(1,191))


#########################
##Question 5
########################

#GDP ranking goes from 1 to 191, we will divide the rankings into these 5 groups:
#1-40
#40-80
#80-120
#120-160
#160-191


countryrank$GDPranking <- as.numeric(countryrank$GDPranking)
#Let's subset countryrank data with the columns GDPranking and income group.
quantile <- countryrank[, c(2,6)]
Q1 <- subset(quantile, GDPranking <=38)
Q2 <- subset(quantile, GDPranking >38 | GDPranking <=76)
Q3 <- subset(quantile, GDPranking >76 | GDPranking <=114)
Q4 <- subset(quantile, GDPranking >114 | GDPranking <=152)
Q5 <- subset(quantile, GDPranking >=152)

quantiles <- c(Q1, Q2, Q3, Q4, Q5)
Qlabels <- c("Q1", "Q2", "Q3", "Q4", "Q5")

quantile$Q <- which(quantile$GDPranking <=38 ="Q1")

#Trying something different...

quantile$Q[quantile$GDPranking <=38] <- Q1
quantile$Q[quantile$GDPranking >38 | quantile$GDPranking <=76] <- Q2
quantile$Q[quantile$GDPranking >76 | quantile$GDPranking <=114] <- Q3
quantile$Q[quantile$GDPranking >114 | quantile$GDPranking <=152] <- Q4
quantile$Q[quantile$GDPranking >=152] <- Q5


#Didn't work so let's sort by GDP rank, and create new column with names
quantile$GDPranking <- as.numeric(quantile$GDPranking)
sortedq <- quantile[order(countryrank$GDPranking),]
sortedq
quantileranks <- cut(sortedq$GDPranking, breaks=c(-0.01, 37.99, 75.99, 113.99, 152.99, 999,99), labels=c("Q1", "Q2", "Q3", "Q4", "Q5"))
#Shows Q1 through Q5 quantile ranks
#Add this as a new column to sortedq dataset to make a table