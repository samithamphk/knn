#
# 21/APR/2019 
#Samitha Patabendige
#



#Generate data for examples from data.R
source(file = "data.R")
#uncomment the line below to see the data
#plot(df,col=ifelse(df$x<=(-1) | df$y==6.0,"red",ifelse(df$y>(-3) & df$y<5,"blue","orange")),pch=15)


# The following is the pseudo code in the blog 

# kNN Pseudo Code
# ---------------
# 
# GIVEN 
# 1 data set as data,  
# 2 an integer as k,
# 3 a function called grouping-task
# 
# 4 FOR data_point IN data
# {
#   5 find distance to all the other data points from the data_piont
#   6 sort the distances in ascending order
#   7 find the kth neigbhour by distance from the data_point
#   8 perform the grouping-task based on the kNN distance to the data_point
# }



# Now lets implement the pseudo code for kNN for Clustering 
# ---------------------------------------------------------


# GIVEN 
# 1 data set as data,  
data = df #df is sources from the data.R

# 2 an integer as k,
k    = 3

# 3 a function called grouping-task
knn_clustering<-function(data_point,clusters,distanc_to_kth_nearest_neigbhour){
  print("This is a dummy implementation of the clustering task, we will implement this function later in the post")
  clusterletter=sample(x = clusters,size = 1)
  print(paste("data point (x=",data_point[1],", y=",data_point[2],") belong to cluster ",clusterletter," distance to the kth NN = ",distanc_to_kth_nearest_neigbhour))
}


# 4 FOR data_point IN data
for(i in 1:nrow(data)){
    data_point=data[i,]
    
    #   5 find distance to all the other data points from the data_piont
    distance_list=list()#1:(nrow(data)-1)#create a temporary distance list that stores the distances to the other data points
    
    for(j in 1:nrow(data)){
      other_data_point=data[j,]
      
      if(other_data_point!=data_point){
        # we use euclidean distance  
        dist_to_other=sqrt((data_point[1]-other_data_point[1])^2+(data_point[2]-other_data_point[2])^2)
        
        distance_list<-c(distance_list,dist_to_other) #add the distance to the list of distances stored temporarily for the ith data point
      }
    }
  
#   6 sort the distances in ascending order
    
   
    distances<-as.vector(unlist(distance_list))
    print(distances[1:5])
    distances<-sort(distances)
    
    
    
#   7 find the kth neigbhour by distance from the data_point
    kth_neibhour_distance=distances[k]#Note: indexes start at 1 in R compared to 0 in python other languages
      
      
#   8 perform the grouping-task based on the kNN distance to the data_point
    knn_clustering(data_point = data_point,clusters = c("A","B","C","D"),distanc_to_kth_nearest_neigbhour = kth_neibhour_distance)
    
}






# kNN for Classification 
# ----------------------

# kNN for Anomaly Detection 
# -------------------------

# kNN for Regression 
# ------------------





# 
# a<-0:10
# b<-0:10
# d<-cbind(a,b)
# print(dist(d,"manhattan",diag = T,upper = T))

