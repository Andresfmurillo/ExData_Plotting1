## Second Plot

household_power <- read.table("household_power_consumption.txt", header = T, na.strings = "?", sep = ";")
subset1_2_2007 <- subset(household_power, Date=="1/2/2007")
subset2_2_2007 <- subset(household_power, Date=="2/2/2007")
power_subset <- rbind(subset1_2_2007, subset2_2_2007)
names(power_subset)

dates_list <- as.character(power_subset$Date)
time_list <- as.character(power_subset$Time)
date_time <- paste(dates_list, time_list)
Time_as_date <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

plot(Time_as_date, power_subset$Global_active_power, type = "l",xlab = "", ylab = "Global active power(kilowatts)" )

dev.copy(png, "Plot2.png", width=480, height=480)
dev.off()
