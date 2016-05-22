# Plot4 script

# Read data from file

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# picking data of 2007-02-01 and 2007-02-02

data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# convert the time and date to Date/Time classes

date <- data_subset$Date
time <- data_subset$Time

x <- paste(date,time, sep=" ")
date_time <- strptime(x, "%d/%m/%Y %H:%M:%S")

# plotting the data

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(date_time,as.numeric(paste(data_subset$Global_active_power)), xlab=" ", ylab="Global Active Power (kilowatts)", type="l")

plot(date_time,as.numeric(paste(data_subset$Voltage)), ylab="Voltage", type="l")

plot(date_time,as.numeric(paste(data_subset$Sub_metering_1)), xlab=" ", ylab="Energy sub metering", type="l")
lines(date_time,as.numeric(paste(data_subset$Sub_metering_2)), type="l", col="red")
lines(date_time,as.numeric(paste(data_subset$Sub_metering_3)), type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))


plot(date_time,as.numeric(paste(data_subset$Global_reactive_power)),ylab="Global reactive power",type="l")
dev.off()