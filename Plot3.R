# Third Plot

household_power <- read.table("household_power_consumption.txt", header = T, na.strings = "?", sep = ";")
subset1_2_2007 <- subset(household_power, Date=="1/2/2007")
subset2_2_2007 <- subset(household_power, Date=="2/2/2007")
power_subset <- rbind(subset1_2_2007, subset2_2_2007)
names(power_subset)

dates_list <- as.character(power_subset$Date)
time_list <- as.character(power_subset$Time)
date_time <- paste(dates_list, time_list)
Time_as_date <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

plot(Time_as_date, power_subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col="black")
lines(Time_as_date, power_subset$Sub_metering_2, col="red")
lines(Time_as_date, power_subset$Sub_metering_3, col="blue")
legend("topright", lty =1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )

dev.copy(png, "Plot3.png", width=480, height=480)
dev.off()
