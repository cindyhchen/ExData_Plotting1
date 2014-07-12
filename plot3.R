# Exploratory Data Analysis
# Course Project 1
# Plot 3

# Set Working directory 
setwd("E:/BCITandCoursea/ExploratoryDataAnalysis/CourseProject1")

# Read data

AllEpowerCon <- read.table("household_power_consumption.txt", header = TRUE, sep=";",na="?")

# only use data from the dates 2007-02-01 and 2007-02-02
EpowerCon <- subset(AllEpowerCon, Date %in% c("1/2/2007","2/2/2007"))

# convert the Date and Time variables to Date/Time classes
EpowerCon$Time <- strptime(paste(EpowerCon$Date, EpowerCon$Time), "%d/%m/%Y %H:%M:%S")
EpowerCon$Date <- as.Date(EpowerCon$Date, "%d/%m/%Y")

png("plot3.png", width=480, height=480, units = "px",bg="white") 

with(EpowerCon, plot(EpowerCon$Time, EpowerCon$Sub_metering_1,
                     type="l",
                     col="black",
                     xlab="",
                     ylab="Energy sub metering"))

with(EpowerCon, points(EpowerCon$Time, EpowerCon$Sub_metering_2,
                       type="l",
                       col="red"))

with(EpowerCon, points(EpowerCon$Time, EpowerCon$Sub_metering_3,
                       type="l",
                       col="blue"))

legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()