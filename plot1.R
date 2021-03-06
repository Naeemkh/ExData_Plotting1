# Plot1 script

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

png("plot1.png",width=480,height=480)
hist(as.numeric(paste(data_subset$Global_active_power)), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()