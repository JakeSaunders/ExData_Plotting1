
# read txt file into data frame
    power.comp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")

# subset data based on dates 1/2/2007 and 2/2/2007
    power.comp <- power.comp[power.comp$Date %in% c("1/2/2007", "2/2/2007"),]
    
# combine date and time columns in new variable and convert to time class
    time <- paste(power.comp$Date, power.comp$Time, sep=" ")
    time <- strptime(time, "%d/%m/%Y %H:%M:%S")

# convert Global_active_power column to numeric class
     gap <- as.numeric(power.comp$Global_active_power)

# make png 480x480 pixels
    png("plot2.png", width=480, height=480)

# make line graph time (x axis) vs Global_active_power (y )
    plot(
        x = time, 
        y = gap, 
        type = "l", 
        xlab="", 
        ylab="Global Active Power (kilowatts)"
    )
    
# close graphics device
    dev.off()
