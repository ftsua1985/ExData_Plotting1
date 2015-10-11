##assumes working directory is already established

##read data into R

data1<-read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")

##subsetting data to plot
data1subset<-data1[data1$Date=="1/2/2007" | data1$Date=="2/2/2007",]
data1subset$Date<-as.Date(data1subset$Date,format="%d/%m/%Y")
dateTime<-data.frame(paste(data1subset$Date,data1subset$Time,sep=" "))
names(dateTime)<-"dateTime"
data1subset<-cbind(data1subset,dateTime)

##Construct the plot and save it to a 480x480 PNG file
png(filename="plot4.png",width=480,height=480)

par(mfcol=c(2,2))
#First plot
hist(data1subset$Global_active_power,freq=T,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")

#Second plot
plot(dateTime, data1subset$Voltage, type="l", ylab="Voltage", 
     xlab="dateTime")

#Third plot
plot(dateTime, data1subset$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering", col="black")
lines(dateTime, data1subset$Sub_metering_2, col="red")
lines(dateTime, data1subset$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Fourth plot
plot(dateTime, data1subset$Global_reactive_power, cex=0.95, type="l", 
     ylab="Global_reactive_power", xlab="dateTime", xaxt="n")