#reading data
df=read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")

#subset data
df=df[df$Date=='1/2/2007'| df$Date=='2/2/2007',]

#concatenate date and time
df$Date=as.Date(df$Date,format="%d/%m/%Y")
df$time_stp=paste(df$Date,df$Time,sep=" ")

#convert to date format
df$time_stp=strptime(df$time_stp, "%Y-%m-%d %H:%M:%S")


#1.create png 
png("plot1.png", width = 480, height = 480)
# 2. Create the plot
hist(df$Global_active_power,xlab = "Global Active Power: Kilowatts",main="Global Active Power",col="red")
# 3. Close the file
dev.off()

