data <- read.table("household_power_consumption.txt",header=TRUE, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), sep=";", na.strings = "?");
data$Date <- as.Date(data$Date,format ="%d/%m/%Y")
x <- data$Date == as.Date("2007-02-02") | data$Date == as.Date("2007-02-01") 
data<-data[x,]
data$Time<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")
png(filename="plot3.png")
plot(data$Time,data$Sub_metering_1,type="n" ,ylab="Energy sub metering",xlab="")
lines(data$Time,data$Sub_metering_1)
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend("topright", col = c("black","red", "blue"), lwd=1,legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()