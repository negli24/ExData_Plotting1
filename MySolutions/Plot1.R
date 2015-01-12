##Plot 1
power_cons<-read.table("household_power_consumption.txt", na.strings="?",sep=";",header=TRUE)
power_cons$datetime=strptime(paste(power_cons$Date,power_cons$Time),"%d/%m/%Y %H:%M:%S")
power_cons$Date<-as.Date(power_cons$Date,format="%d/%m/%Y")
power_cons_short1=power_cons[power_cons$Date=="2007-02-01" ,]
power_cons_short2=power_cons[power_cons$Date=="2007-02-02" ,]
power_cons_short=rbind(power_cons_short1,power_cons_short2)

png(filename="Plot1.png", width=480, height=480)
hist(power_cons_short$Global_active_power,col="Red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()