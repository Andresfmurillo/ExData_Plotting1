# First plot
household_power <- read.table("household_power_consumption.txt", header = T, na.strings = "?", sep = ";")
subset1_2_2007 <- subset(household_power, Date=="1/2/2007")
subset2_2_2007 <- subset(household_power, Date=="2/2/2007")
power_subset <- rbind(subset1_2_2007, subset2_2_2007)
names(power_subset)
with(power_subset, hist(Global_active_power, col="red", xlab = "Global active power(kilowatts)", main = "Global active power"))
dev.copy(png, "Plot1.png", width=480, height=480)
dev.off()
