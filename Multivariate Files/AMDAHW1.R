x1=c(1,2,3,3,4,5,6,8,9,11)
x2=c(18.95, 19, 17.95, 15.54, 14, 12.95, 8.94, 7.49, 6, 3.99)
data=cbind(x1,x2)
data

#a)
plot(x2~x1, data=data)

#b)
#the sample covariance s_12 is negative

#c)
mean(x1)
mean(x2)
var(x1)
var(x2)
cov(x1,x2)
cor(x1,x2)

#d)
apply(data,1,mean)
var(data)
cor(data)

#######################################
sales=c(108.28, 152.36, 95.04, 65.45, 62.97, 263.99, 265.19, 285.06, 92.01, 165.68)
profits=c(17.05, 16.59, 10.92, 14.14, 9.52, 25.33, 18.54, 15.73, 8.1, 11.13)
assets=c(1484.1, 750.33, 766.42, 1110.46, 1031.29, 195.26, 193.83, 191.11, 1175.16, 211.15)
data=cbind(sales,profits,assets)
data

plot(profits~sales, data=data)

mean(sales)
mean(profits)
var(sales)
var(profits)
cov(sales,profits)
cor(sales, profits)

############################################
sales=c(108.28, 152.36, 95.04, 65.45, 62.97, 263.99, 265.19, 285.06, 92.01, 165.68)
profits=c(17.05, 16.59, 10.92, 14.14, 9.52, 25.33, 18.54, 15.73, 8.1, 11.13)
assets=c(1484.1, 750.33, 766.42, 1110.46, 1031.29, 195.26, 193.83, 191.11, 1175.16, 211.15)
data=cbind(sales,profits,assets)
data

plot(assets~sales, data=data)
plot(profits~assets, data=data)

apply(data,2,mean)
var(data)
cor(data)

###########################################
data=read.csv("Air_pollution.csv")
data

apply(data,2,mean)
cov(data)
cor(data)

#########################################
data=read.csv("T1_9_National_track_records_for_women.csv")

apply(data[-1],2,mean)
cov(data[-1])
cor(data[-1])