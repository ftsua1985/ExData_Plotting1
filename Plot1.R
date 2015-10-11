##assumes working directory is already established

##read data into R

data1<-read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")

##subsetting data to plot
data1subset<-data1[data1$Date=="1/2/2007" | data1$Date=="2/2/2007",]

##write 480x480 PNG file
png(filename="plot1.png",width=480,height=480)

##print plot data
hist(data1subset$Global_active_power,freq=T,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
