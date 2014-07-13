##Script used to create plot3.png
##Read in and clean the data.
##The data file has already been saved and unzipped to the working directory. 
setwd("~/Documents/Coursera/Class 4/")
household_power_consumption <- read.csv("~/Documents/Coursera/Class 4/household_power_consumption.txt", 
                                        sep=";", na.strings="?", stringsAsFactors=FALSE)
View(household_power_consumption)

power1 <- subset(household_power_consumption, Date == "1/2/2007")
power2 <- subset(household_power_consumption, Date == "2/2/2007")
powerbind <- rbind(power1, power2)
DateTime <- with(powerbind, paste(Date, Time, sep=" "))
DateandTime <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

bind <- cbind(DateandTime, powerbind)

##Create plot 3
png("plot3.png", width=480, height=480)
plot(bind$DateandTime, bind$Sub_metering_1, type="l",
     xlab="",
     ylab="Energy sub metering")
lines(bind$DateandTime, bind$Sub_metering_2, col="red")
lines(bind$DateandTime, bind$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, 
       col=c("black", "red", "blue"))
png("plot3.png", width=480, height=480)
dev.off()
## The file has been saved to your working directory. Move the file into a different folder if necessary.