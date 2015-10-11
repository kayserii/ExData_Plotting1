# source file
#fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#download file to working directory
#download.file(fileUrl, destfile = ".exdata%2Fdata%2Fhousehold_power_consumption.zip", mode="wb")

# unzip the data to working directory
# the unzipped file is "household_power_consumption.txt"
#unzip(".exdata%2Fdata%2Fhousehold_power_consumption.zip", exdir = ".")

electric_power_consumption <- read.table(file="household_power_consumption.txt", sep= ";", header = TRUE)

ds <- electric_power_consumption[(electric_power_consumption$Date %in% c('1/2/2007','2/2/2007')),]

fd <- paste(as.character(ds$Date),as.character(ds$Time),sep=":")

fd.num <- as.numeric(strptime(fd,format='%d/%m/%Y:%H:%M:%S'))

fd.num <- fd.num - fd.num[1]

s1 <- as.numeric(as.character(ds$Sub_metering_1))
s2 <- as.numeric(as.character(ds$Sub_metering_2))
s3 <- as.numeric(as.character(ds$Sub_metering_3))

png(file="plot3.png", width=480, height = 480)

plot(fd.num, s1, type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering", col = "black")
lines(fd.num, s2, type = "l", col = "red")
lines(fd.num, s3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# Make x axis using Thu-Fri-Sat labels
axis(1, at=c(0,86370,172700), labels=c("Thu","Fri","Sat"))

dev.off()



