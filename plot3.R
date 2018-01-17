#load data and transform date and time in R formats

if (!getwd()==("/Users/hoeak6/Dropbox/Research/class_dataSc./exploratory_data/week1/progAssignment_week1/")) {
  setwd("/Users/hoeak6/Dropbox/Research/class_dataSc./exploratory_data/week1/progAssignment_week1/")}

dataset <- "/Users/hoeak6/Dropbox/Research/class_dataSc./exploratory_data/week1/household_power_consumption.txt"
electric  <- read.table(dataset, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")
electric$Date <- as.Date(electric$Date, format = "%d/%m/%Y")

sub_electric <- subset(electric, Date == "2007-02-01" | Date == "2007-02-02")

sub_electric$dateTime <- strptime(paste(sub_electric$Date, sub_electric$Time), "%Y-%m-%d %H:%M:%S")

# plot 3

png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")
with(sub_electric, plot(dateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))
with(sub_electric, lines(dateTime, Sub_metering_2, col = "red"))
with(sub_electric, lines(dateTime, Sub_metering_3, col = "blue"))
legend("topright", pch = 95,col = c("black", "red", "blue"), lty=1, cex =0.8, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()