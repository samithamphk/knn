#
# 21/APR/2019 
#Samitha Patabendige
#

set.seed(125)#for reproducability

dist1<-runif(n = 20,min = 0,max=1)   #creates a uniform distribution of 20 points in the range [0,1]
dist2<-rnorm(n = 20, mean=0,sd=0.75) #creates a standard normal distribution of 20 points
groupA<-cbind(dist1,dist2)           #create a dataframe by combining dist1 and dist2

dist3<-rnorm(n=78,mean=10,sd=0.75)   #create a normal distribution of 50 data points
dist4<-rnorm(n=78,mean=10,sd=0.75)   #create another normal distribution of 50 data points
groupB<-cbind(dist3,dist4)           #create a dataframe by combining dist3 and dist4

anom1<-c(0.99,6.00)                  #create a hardcoded anomalous datapoint
anom2<-c(-3.5,-3.5)                  #create another hardcoded anomalous datapoint

df<- data.frame(rbind(groupA,groupB,anom1,anom2))#combine all the data together
colnames(df)<-c("x","y")             #name the columns as x and y

#View(head(df))                      #if you want to view the first few records of the data, uncomment this line


#colour manually for illustration
plot(df,col=ifelse(df$x<=(-1) | df$y==6.0,"red",ifelse(df$y>(-3) & df$y<5,"blue","green")),pch=20,cex=2)