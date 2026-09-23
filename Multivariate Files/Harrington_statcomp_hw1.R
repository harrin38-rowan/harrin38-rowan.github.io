data= read.csv('http://manctsui.github.io/datasets/countries.csv')

############# 1) determine how many eastern europe countries have positive net migration
data_EE = data[data$Region %in% "EASTERN EUROPE",]
data_EE$Q1 = ifelse( data_EE$Net.migration > 0, TRUE, FALSE )
data_EE = data_EE[data_EE$Q1,]
length(data_EE$Q1)
############# 6 eastern europe countries have positive net migration

############# 2) list 3 eastern europe countries with most positive net migration
data_EE= data_EE[order(data_EE$Net.migration, decreasing = T),]
data_EE[c(1,2,3),1]
############# "Croatia" "Slovenia" "Czech Republic"

############# 3) list 3 eastern europe countries with most negative net migration
data_EE = data[data$Region %in% "EASTERN EUROPE",]
data_EE= data_EE[order(data_EE$Net.migration, decreasing = F),]
data_EE[c(1,2,3),1]
############# "Albania" "Bulgaria" "Macedonia"

############# 4) report countries whose net migration is NA
data$Net.migration
data$Q4 = ifelse(data$Net.migration != 0, data$Net.migration, NA)
data$Country[is.na(data$Q4)]
#############

############# 5) countries with 2,000,000 sqr miles, or pop > 25 million
data$Q5 = ifelse(data$Population > 25000000 | data$Area..sq..mi.. > 2000000, T, F)
data[data$Q5, c("Country", "Population", "Area..sq..mi..")]
#############

############# 6) find countries with birthrate < deathrate and countries with unknown birthrate or deathrate
data$Q6 = ifelse(data$Birthrate < data$Deathrate,T,F)
data6 = data[data$Q6,] 
length(data6$Country)
data$Q62 = ifelse(data$Birthrate == "NA" | data$Deathrate == "NA" , F, T)
data$Q62
data62= data[!data$Q62,] 
length(data62$Country)
############# 29 countries have less brithrate than deathrate. 4 countries have unknown birth or deathrate

############# 7) make a column of birthrate - deathrate
data$Natural_population_change = data$Birthrate-data$Deathrate
data$Natural_population_change
#############

############# 8) Identify the 3 most populous countries in the dataset
row_cond = order(data$Population, decreasing = T)
col_cond = "Country"
head(data[row_cond,col_cond],3)
############# "China" "India" "United States"

############ 9) Which countries have a population which is at least 30% the size of the population of the 3rd most populous country?
row_cond = order(data$Population, decreasing = T)
col_cond = c("Country", "Population")
head(data[row_cond,col_cond],3)
min_pop = 298444215
data$Q9 = ifelse(data$Population > min_pop*.3, T, F)
data[data$Q9,"Country"]
##############

############## 10. Use the aggregate function to determine the typical population size of each region.
aggregate(Population ~ Region, data=data, FUN = mean)
