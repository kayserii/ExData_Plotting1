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

png(file="plot1.png", width=480, height = 480)
hist(active.power, ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "Red", main = "Global Active Power")
dev.off()



