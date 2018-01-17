#load data and transform date and time in R formats

if (!getwd()==("/Users/hoeak6/Dropbox/Research/class_dataSc./exploratory_data/week1/progAssignment_week1/")) {
  setwd("/Users/hoeak6/Dropbox/Research/class_dataSc./exploratory_data/week1/progAssignment_week1/")}

dataset <- "/Users/hoeak6/Dropbox/Research/class_dataSc./exploratory_data/week1/household_power_consumption.txt"
electric  <- read.table(dataset, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")
electric$Date <- as.Date(electric$Date, format = "%d/%m/%Y")

sub_electric <- subset(electric, Date == "2007-02-01" | Date == "2007-02-02")

sub_electric$dateTime <- strptime(paste(sub_electric$Date, sub_electric$Time), "%Y-%m-%d %H:%M:%S")


# plot 4

png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")
#divide window with plot in 4
par(mfrow = c(2,2))
# plot 1 top left
plot(sub_electric$dateTime, sub_electric$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
#plot 2 top right
plot(sub_electric$dateTime, sub_electric$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#plot 3 bottom left
with(sub_electric, plot(dateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))
with(sub_electric, lines(dateTime, Sub_metering_2, col = "red"))
with(sub_electric, lines(dateTime, Sub_metering_3, col = "blue"))
legend("topright", pch = 95,col = c("black", "red", "blue"), lty=1, cex =0.8, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
#plot 4 bottom right
plot(sub_electric$dateTime, sub_electric$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()