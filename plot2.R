# Code for Global Active Power plot (plot2) creation

# Reading of .txt file to data variable, subsetting and data conversion
data <- read.table("corso exploratory data analysis/household_power_consumption.txt", sep=";")

data = transform(data, V1 = as.character(V1))
data = transform(data, V1 = as.Date(V1,format=("%d/%m/%Y")))

data = transform(data, V2 = as.character(V2))

data = transform(data, V2 = strptime(V2,format=("%H:%M:%S")))

datatu<-subset(data, data$V1 >= "2007/02/01" & data$V1 <= "2007/02/02")

datatuse = transform(datatu, V3 = as.character(V3),V4 = as.character(V4),V5 = as.character(V5),V6 = as.character(V6),V7 = 
                       as.character(V7),V8 = as.character(V8),V9 = as.character(V9))

datatuse = transform(datatuse, V3 = as.double(V3),V4 = as.double(V4),V5 = as.double(V5),V6 = as.double(V6),V7 = as.double(V7),V8 = 
                       as.double(V8),V9 = as.double(V9))

datatuse<-transform(datatuse,V2=as.character(V2))
datatuse$V2<-gsub("^.*? ","",datatuse$V2)
datatuse<-transform(datatuse,V1=as.character(V1))
datatuse$V10<-paste(datatuse$V1,datatuse$V2,sep=" ")
datatouse<-transform(datatuse,V10=strptime(V10,format="%Y-%m-%d %H:%M:%S"))
with(datatouse,plot(V10,V3,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.copy(png, file = "plot2.png")
dev.off()
