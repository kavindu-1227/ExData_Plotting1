#reading data
df=read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")

#subset data
df=df[df$Date=='1/2/2007'| df$Date=='2/2/2007',]

#concatenate date and time
df$Date=as.Date(df$Date,format="%d/%m/%Y")
df$time_stp=paste(df$Date,df$Time,sep=" ")

#convert to date format
df$time_stp=strptime(df$time_stp, "%Y-%m-%d %H:%M:%S")


##plot4
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#1,1
plot(df$time_stp,df$Global_active_power, 
     ylab="Global active power kilowatts",
     type="l"
)

#1,2
plot(df$time_stp,df$Voltage, 
     ylab="Voltage",
     type="l"
)

#2,1
plot(df$time_stp,df$Sub_metering_1, 
     ylab="Energy Sub Metering",
     type="l"
)
lines(df$time_stp,df$Sub_metering_2, col="red")
lines(df$time_stp,df$Sub_metering_3, col="blue")
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       fill=c("black","red","blue")
)

#2,2
plot(df$time_stp,df$Global_reactive_power, 
     ylab="Global Reactive Power",
     type="l"
)

dev.off()


