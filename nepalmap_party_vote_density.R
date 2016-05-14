#putting proper 
# library(plyr)
library(rgeos)
library(maptools)
# library(gpclib)
library(ggplot2)
# library(XML)
library(scales)
library(RColorBrewer)

np_dist <- readShapeSpatial("data/NPL_adm/NPL_adm3.shp")
np_dist <- fortify(np_dist, region = "NAME_3")
data <- dget("data/party_vote_density.txt")
# print(typeof(doc[[1,2]]))
party_name ="राष्ट्रिय प्रजातन्त्र पार्टी नेपाल "
totalvote = as.numeric(data$total)
district = as.character(data$district)
category = as.character(data$category)
party = as.character(data$party)

data_frame = data.frame(totalvote = totalvote, district = district, category = category, party = party)
# split_by_party<-split(data_frame,party)
# data_by_party=split_by_party[[party_name]]
# data_by_party<-data_by_party[-c(4)]
# print(data_by_party)
#tyo baneko file load garne 
#then making final file 
#ani map ma load




# complete_data[75,1] <-100000
# print(complete_data)
#remember to append from next step
#this complete data is to be saved as a csv file haita 
#npdist map is ready to be filled with data guys woooooHoooooooo! Just a step more to the celebration
mp<-ggplot() + geom_map(data = data_frame, aes(map_id = district, fill = totalvote), 
                        map = np_dist,color = "black") + expand_limits(x = np_dist$long, y = np_dist$lat)+
    scale_fill_gradient2(low = ("#032256"), mid = ("white"),
                       high =muted("#F8808C"),midpoint = 10000, limits = c(80, 121500),breaks=c(10000,20000,30000,40000,
                                                                                                50000,60000,70000,90000,100000,121500))+
  labs(x = "Lat", y = "Long",title="Nepal Party Votes")+facet_grid(facets= party~category) 
print(mp)
# print(complete_data)
# print(data_by_party[1,1])
# namesInData <- complete_data$district
# namesInMap <- levels(factor(np_dist$id))
# 
# # print(namesInData[which(!namesInData %in% namesInMap)])
# 
# print(namesInMap[which(!namesInMap %in% namesInData)])

# distcenters <- ddply(np_dist, .(id), summarize, clat = mean(lat), clong = mean(long))
# print((distcenters[1]))


#now the idea is to save this data i.e make a new data
#this algorithm say refined the data and now gonna save this data in a csv file ,append other parties data too
#and gonna make a facet wrap to make things easy


