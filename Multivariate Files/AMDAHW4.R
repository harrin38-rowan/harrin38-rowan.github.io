sales=c(108.28, 152.36, 95.04, 65.45, 62.97, 263.99, 265.19, 285.06, 92.01, 165.68)
profits=c(17.05, 16.59, 10.92, 14.14, 9.52, 25.33, 18.54, 15.73, 8.1, 11.13)
data=cbind(sales,profits)
data = data.frame(data)
data$sales



mean(data$sales)
mean(data$profits)
center = cbind(mean(sales), mean(profits))
# center =data.frame(center)
center

sig_matrix = cov(data)

data$md2 = mahalanobis(data,center,sig_matrix, inverted = F)
data$md2
data

x<-vector("numeric", length=nrow(data))
q<-vector("numeric", length=nrow(data))
data<-data.frame(data, x,q)
datas<-data[order(data$md2, decreasing=F),] 

for( i in 1:nrow(data)){
  datas$x[i]<-(i-0.5)/nrow(data)
  datas$q[i]<-qchisq(datas$x[i], df=4,lower.tail = TRUE)
}

plot(datas$md2, datas$q)
