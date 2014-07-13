## Plot Global Active Power
powerdata <- read.table(pipe('grep "^[0-2]/2/2007" "household_power_consumption.txt"'),header=F,sep=';')
colnames(powerdata) <- names(read.table('household_power_consumption.txt', header=TRUE, sep=";", nrows=1))
png("plot1.png", width=480, height=480)
hist(dat$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", yaxp=c(0,1200, 6))
dev.off() 
