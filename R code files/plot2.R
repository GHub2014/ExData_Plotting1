##Script used to create plot2.png
##Read in and clean data.
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

##Create plot 2
png("plot2.png", width=480, height=480)

with(bind, plot(DateandTime, Global_active_power, type="l", 
                ylab="Global Active Power (kilowatts)",xlab=""))

dev.off()
## The file has been saved to your working directory. Move the file into a different folder if necessary.