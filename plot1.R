# Exploratory Data Analysis
# Course Project 1
# Plot 1

# Set Working directory 
setwd("E:/BCITandCoursea/ExploratoryDataAnalysis/CourseProject1")

# Read data

AllEpowerCon <- read.table("household_power_consumption.txt", header = TRUE, sep=";",na="?")
    
# only use data from the dates 2007-02-01 and 2007-02-02
EpowerCon <- subset(AllEpowerCon, Date %in% c("1/2/2007","2/2/2007"))

# convert the Date and Time variables to Date/Time classes
EpowerCon$Time <- strptime(paste(EpowerCon$Date, EpowerCon$Time), "%d/%m/%Y %H:%M:%S")
EpowerCon$Date <- as.Date(EpowerCon$Date, "%d/%m/%Y")


par(mar = c(5,4,2,1))
png("plot1.png", width=480, height=480,units = "px",bg="white")   # bg="transparent" is not working

hist(EpowerCon$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

dev.off()