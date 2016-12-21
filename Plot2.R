## Getting full dataset
dframe <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dframe$Date <- as.Date(dframe$Date, format="%d/%m/%Y")

## Subsetting the data
dframesub <- subset(dframe, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dframe)

## Converting dates
dfsubDateTime <- paste(as.Date(dframesub$Date), dframesub$Time)
dframesub$Datetime <- strptime(dfsubDateTime,format="%Y-%m-%d %H:%M:%S")

## Plot 1
hist(dframesub$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",  col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()