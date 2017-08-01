setwd("~MyProjects/EDA/week1")
data<-read.csv("household_power_consumption.txt", header=T,
               sep=';', na.strings="?", nrows=2075259, 
               check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

uptodatedata<- subset(data, Date %in% c("1/2/2007","2/2/2007"))
uptodatedata$Date<-as.Date(uptodatedata$Date, format="%d/%m/%y")

electricpower<-na.omit(uptodatedata)
#plot1
plot1<-hist(electricpower$Global_active_power, col = "red", xlab="Global active power", main = "Global Active Power")

png("plot1.png", width=480, height=480)
dev.off()
























