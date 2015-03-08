## Read everything and then focus on the dates for the assignment
## ## We could read a subset of the file using "skip" and "nrows" but got
## ## enough RAM to read all :)
df <- read.csv("./data/household_power_consumption.txt", sep=";",
            na.strings="?", colClasses=c("character", "character", "numeric",
            "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
myDF <- df[(df$Date=="1/2/2007" | df$Date=="2/2/2007"), ]
rm(df)  ## we don't need that any more... clear RAM

## Need Date&Time columns to be converted to POSIX date-time
myDF$DT <- paste(myDF$Date, myDF$Time)      ## create new merged char column
x <- strptime(myDF$DT, "%d/%m/%Y %H:%M:%S") ## char to datetime conversion



png(file="plot4.png")   ## png defaults are good enough to match output

par(mfrow = c(2,2))

## TOP-LEFT: identical to our plot2
plot(x, myDF$Global_active_power, type="l", xlab="", ylab="Global Active Power")


## TOP-RIGHT: similar to our plot2
plot(x, myDF$Voltage, type="l", xlab="datetime", ylab="Voltage")


## BOTTOM-LEFT: similar to our plot3
with(myDF, plot(x, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering"))
lines(x, myDF$Sub_metering_2, col="red")
lines(x, myDF$Sub_metering_3, col="blue")

legText <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legCol <- c("black", "red", "blue")
legType <- c(1,1,1)
legLineWidth <- c(2.5, 2.5, 2.5)
legend("topright", legend=legText, col=legCol, bty="n", lty=legType, lwd=legLineWidth)

## BOTTOM-RIGHT: similar to our plot2
plot(x, myDF$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Be sure to turn off the graphics device
dev.off()