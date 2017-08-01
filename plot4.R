setwd("~MyProjects/EDA/week1")

data <- read.csv("household_power_consumption.txt", header=T, sep=';',
                 na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F,
                 comment.char="", quote='\"')
uptodatedata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
uptodatedata$Date <- as.Date(uptodatedata$Date, format="%d/%m/%Y")
dateTime <- paste(uptodatedata$Date, uptodatedata$Time)
uptodatedata$Datetime <- as.POSIXct(dateTime)


par(mar=c(2,4,1,1), oma=c(0,0,2,0))
with(uptodatedata, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
})


with(uptodatedata, {plot(Voltage~Datetime, type="l")})

with(uptodatedata, {plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")})
lines(uptodatedata$Sub_metering_2~uptodatedata$Datetime,type="l", col = "red")
lines(uptodatedata$Sub_metering_3~uptodatedata$Datetime,type="l", col = "blue")

legend("topright", lty=1, lwd =3, col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", "Sub_metering_3"))

with(uptodatedata, {plot(Global_reactive_power~Datetime, type="l")})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()