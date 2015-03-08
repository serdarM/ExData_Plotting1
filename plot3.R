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



png(file="plot3.png")   ## png defaults are good enough to match output

## Create our plots first...
with(myDF, plot(x, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering"))
lines(x, myDF$Sub_metering_2, col="red")
lines(x, myDF$Sub_metering_3, col="blue")

## .. then work on the legend
legText <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legCol <- c("black", "red", "blue")
legType <- c(1,1,1)
legLineWidth <- c(2.5, 2.5, 2.5)
legend("topright", legend=legText, col=legCol, lty=legType, lwd=legLineWidth)


## Be sure to turn off the graphics device
dev.off()