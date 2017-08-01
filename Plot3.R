setwd("~MyProjects/EDA/week1")

data <- read.csv("household_power_consumption.txt", header=T, sep=';',
                 na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F,
                 comment.char="", quote='\"')
uptodatedata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
uptodatedata$Date <- as.Date(uptodatedata$Date, format="%d/%m/%Y")
dateTime <- paste(uptodatedata$Date, uptodatedata$Time)
uptodatedata$Datetime <- as.POSIXct(dateTime)



#plot3

with(uptodatedata, {plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")})
lines(uptodatedata$Sub_metering_2~uptodatedata$Datetime,type="l", col = "red")
lines(uptodatedata$Sub_metering_3~uptodatedata$Datetime,type="l", col = "blue")

legend("topright", lty=1, lwd =3, col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", "Sub_metering_3"))

png("plot3.png", width=480, height=480)
dev.off()
