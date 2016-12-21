## Getting full dataset
dframe <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dframe$Date <- as.Date(dframe$Date, format="%d/%m/%Y")

## Subsetting the data
dframesub <- subset(dframe, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dframe)

## Converting dates
dfsubDateTime <- paste(as.Date(dframesub$Date), dframesub$Time)
dframesub$Datetime <- as.POSIXct(dfsubDateTime)

## Plot 3
with(dframesub, {plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


