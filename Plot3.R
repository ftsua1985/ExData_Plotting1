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
png(filename="plot3.png",width=480,height=480)

##3. Plot data
plot(data1subset$dateTime,data1subset$Sub_metering_1,ylab="Energy sub metering",type="l",xaxt="n")
lines(data1subset$dateTime,data1subset$Sub_metering_1,ylab="Energy sub metering")
lines(data1subset$Sub_metering_2, type="l", col="red")
lines(data1subset$Sub_metering_3, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(1,at=1:3,lab=c("Thu","Fri","Sat"))