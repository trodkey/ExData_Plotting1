powerdata <- read.table(pipe('grep "^[0-2]/2/2007" "household_power_consumption.txt"'),header=F,sep=';')
colnames(powerdata) <- names(read.table('household_power_consumption.txt', header=TRUE, sep=";", nrows=1))
date_and_time <- paste(powerdata$Date, powerdata$Time)
newdatetime <- strptime(date_and_time,format="%d%m%Y %H:%M:%S")

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

with(powerdata$newdatetime, plot(powerdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xaxt='n', ann=FALSE))
axis(side=1, at=c(0,1500,2880), labels=c('Thu', 'Fri', 'Sat'))
mtext(side = 2, "Global Active Power", cex=0.75, line=2, padj=-1)

with(powerdata$newdatetime, plot(powerdata$Voltage, type="l", ylab="Global Active Power (kilowatts)", xaxt='n', ann=FALSE))
axis(side=1, at=c(0,1500,2880), labels=c('Thu', 'Fri', 'Sat'))
mtext(side = 2, "Voltage", line = 2, cex=0.75, padj=-1)
mtext(side = 1, "datetime", cex=0.75, line = 2, padj=1)

with(powerdata$newdatetime, plot(powerdata$Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xaxt='n', ann=FALSE))
with(powerdata$newdatetime, lines(powerdata$Sub_metering_2, col="red"))
with(powerdata$newdatetime, lines(powerdata$Sub_metering_3, col="blue"))
axis(side=1, at=c(0,1500,2880), labels=c('Thu', 'Fri', 'Sat'))
mtext(side = 2, "Energy sub metering", line = 2, cex=0.75, padj=-1)
legend("topright", col = c("black", "red", "blue"), lty= "solid", bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8 )

with(powerdata$newdatetime, plot(powerdata$Global_reactive_power, type="l", ylab="Global Reactive Power (kilowatts)", xaxt='n', ann=FALSE))
axis(side=1, at=c(0,1500,2880), labels=c('Thu', 'Fri', 'Sat'))
mtext(side = 2, "Global_reactive_power", line = 2, cex=0.75, padj=-1)
mtext(side = 1, "datetime", line = 2, cex=0.75, padj=1)
dev.off()