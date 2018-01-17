#load data and transform date and time in R formats

if (!getwd()==("/Users/hoeak6/Dropbox/Research/class_dataSc./exploratory_data/week1/progAssignment_week1/")) {
  setwd("/Users/hoeak6/Dropbox/Research/class_dataSc./exploratory_data/week1/progAssignment_week1/")}

electric  <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")
electric$Date <- as.Date(electric$Date, format = "%d/%m/%Y")

sub_electric <- subset(electric, Date == "2007-02-01" | Date == "2007-02-02")

sub_electric$dateTime <- strptime(paste(sub_electric$Date, sub_electric$Time), "%Y-%m-%d %H:%M:%S")

# plot 1

png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
hist(sub_electric$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()