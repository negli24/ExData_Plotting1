power_cons<-read.table("household_power_consumption.txt", na.strings="?",sep=";",header=TRUE)
power_cons$datetime=strptime(paste(power_cons$Date,power_cons$Time),"%d/%m/%Y %H:%M:%S")
power_cons$Date<-as.Date(power_cons$Date,format="%d/%m/%Y")
power_cons_short1=power_cons[power_cons$Date=="2007-02-01" ,]
power_cons_short2=power_cons[power_cons$Date=="2007-02-02" ,]
power_cons_short=rbind(power_cons_short1,power_cons_short2)
png(filename="Plot3.png", width=480, height=480)

plot(power_cons_short$datetime,power_cons_short$Sub_metering_1,type="l",xlab="",ylab="Energy Sub-Metering)")
lines(power_cons_short$datetime,power_cons_short$Sub_metering_2,col="red")
lines(power_cons_short$datetime,power_cons_short$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub-Metering 1","Sub-Metering 2","Sub-Metering 3"),col=c("black","red","blue"),lwd=par("lwd"))
dev.off()