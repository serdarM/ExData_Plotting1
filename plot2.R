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



png(file="plot2.png")   ## png defaults are good enough to match output

## To match output, all we need to customize is plot-type and x&y labels
plot(x, myDF$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

## Be sure to turn off the graphics device
dev.off()