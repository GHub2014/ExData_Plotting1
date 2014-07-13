##Script used to create plot1.png
##Read in and clean the data.
##The data file has already been saved and unzipped to the working directory. 
setwd("~/Documents/Coursera/Class 4")
household_power_consumption <- read.csv("~/Documents/Coursera/Class 4/household_power_consumption.txt", 
               sep=";", na.strings="?", stringsAsFactors=FALSE)
View(household_power_consumption)

power1 <- subset(household_power_consumption, Date == "1/2/2007")
power2 <- subset(household_power_consumption, Date == "2/2/2007")
powerbind <- rbind(power1, power2)
DateTime <- with(powerbind, paste(Date, Time, sep=" "))
DateandTime <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

bind <- cbind(DateandTime, powerbind)

##Create plot 1
x <- as.numeric(bind$Global_active_power)

png("plot1.png", width=480, height=480)

hist(x, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", freq=TRUE, 
              ylim=c(0,1200), col="red", breaks = 11, seq(from=0, to=8, by=2), cex.axis=0.8, cex.lab=0.9)

dev.off()
## The file has been saved to your working directory. Move the file into a different folder if necessary.
