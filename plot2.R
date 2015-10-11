# source file
#fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#download file to working directory
#download.file(fileUrl, destfile = ".exdata%2Fdata%2Fhousehold_power_consumption.zip", mode="wb")

# unzip the data to working directory
# the unzipped file is "household_power_consumption.txt"
#unzip(".exdata%2Fdata%2Fhousehold_power_consumption.zip", exdir = ".")

electric_power_consumption <- read.table(file="household_power_consumption.txt", sep= ";", header = TRUE)

ds <- electric_power_consumption[(electric_power_consumption$Date %in% c('1/2/2007','2/2/2007')),]

active.power <- as.numeric(as.character(ds$Global_active_power))

fd <- paste(as.character(ds$Date),as.character(ds$Time),sep=":")

fd.num <- as.numeric(strptime(fd,format='%d/%m/%Y:%H:%M:%S'))

fd.num <- fd.num - fd.num[1]

png(file="plot2.png", width=480, height = 480)

plot(fd.num,active.power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")

# Make x axis using Thu-Fri-Sat labels
axis(1, at=c(0,86370,172700), labels=c("Thu","Fri","Sat"))

dev.off()



