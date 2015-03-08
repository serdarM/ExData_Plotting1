## Read everything and then focus on the dates for the assignment
## ## We could read a subset of the file using "skip" and "nrows" but got
## ## enough RAM to read all :)
df <- read.csv("./data/household_power_consumption.txt", sep=";",
            na.strings="?", colClasses=c("character", "character", "numeric",
            "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
myDF <- df[(df$Date=="1/2/2007" | df$Date=="2/2/2007"), ]
rm(df)  ## we don't need that any more... clear RAM


png(file="plot1.png")   ## png defaults are good enough to match output

## Color and Labels seem to be the only customizations required for our histogram
hist(myDF$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

## Be sure to turn off the graphics device
dev.off()