x = c(1,2,1)
x
mu = c(0,1,1)
mu
S_inverse = matrix(c(1,1,2,1,2,2,2,2,3),nrow=3,byrow=T)
S_inverse

mahalanobis(x,mu,S_inverse, inverted=T)
#######################