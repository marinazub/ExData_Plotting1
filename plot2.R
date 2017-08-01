setwd("~MyProjects/EDA/week1")

data <- read.csv("household_power_consumption.txt", header=T, sep=';',
                 na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F,
                 comment.char="", quote='\"')
uptodatedata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
uptodatedata$Date <- as.Date(uptodatedata$Date, format="%d/%m/%Y")
dateTime <- paste(uptodatedata$Date, uptodatedata$Time)
uptodatedata$Datetime <- as.POSIXct(dateTime)



## Plot 2
plot2<-with(uptodatedata, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
})


png("plot2.png", width=480, height=480)
dev.off()
