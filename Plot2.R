##assumes working directory is already established

##read data into var data1
data1<-read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")

##Subseting data to plot
data1subset<-data1[data1$Date=="1/2/2007" | data1$Date=="2/2/2007",]
data1subset$Date<-as.Date(data1subset$Date,format="%d/%m/%Y")
dateTime<-data.frame(paste(data1subset$Date,data1subset$Time,sep=" "))
names(dateTime)<-"dateTime"
data1subset<-cbind(data1subset,dateTime)

##write 480x480 PNG file
png(filename="plot2.png",width=480,height=480)

##print plot data
plot(data1subset$dateTime,data1subset$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xaxt="n")
lines(data1subset$dateTime,data1subset$Global_active_power,ylab="Global Active Power (kilowatts)")
axis(1,at=1:3,lab=c("Thu","Fri","Sat"))