powerdata <- read.table(pipe('grep "^[0-2]/2/2007" "household_power_consumption.txt"'),header=F,sep=';')
colnames(powerdata) <- names(read.table('household_power_consumption.txt', header=TRUE, sep=";", nrows=1))
png("plot3.png", width=480, height=480)
date_and_time <- paste(powerdata$Date, powerdata$Time)
newdatetime <- strptime(date_and_time,pformat="%d%m%Y %H:%M:%S")
with(powerdata$newdatetime, plot(powerdata$Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xaxt='n', ann=FALSE))
with(powerdata$newdatetime, lines(powerdata$Sub_metering_2, col="red"))
with(powerdata$newdatetime, lines(powerdata$Sub_metering_3, col="blue"))
axis(side=1, at=c(0,1500,2880), labels=c('Thu', 'Fri', 'Sat'))
mtext(side = 2, "Energy sub metering", line = 2, padj=-1)
legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8 )
dev.off()