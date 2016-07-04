
# read txt file into data frame
    power.comp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")

# subset data based on dates 1/2/2007 and 2/2/2007
    power.comp <- power.comp[power.comp$Date %in% c("1/2/2007", "2/2/2007"),]

# combine date and time columns in new variable and convert to time class
    time <- paste(power.comp$Date, power.comp$Time, sep=" ")
    time <- strptime(time, "%d/%m/%Y %H:%M:%S")

# make varibles for y axises
    # graph 1
        act.power <- as.numeric(power.comp$Global_active_power)
    # graph 2
        voltage <- as.numeric(power.comp$Voltage)
    # graph 3
        black.line <- power.comp$Sub_metering_1
        red.line <- power.comp$Sub_metering_2
        blue.line <- power.comp$Sub_metering_3
    # graph 4
        react.power <- as.numeric(power.comp$Global_reactive_power)

# make png 480x480 pixels
    png("plot4.png", width=480, height=480)

# make 2x2 plot
    par(mfrow = c(2, 2)) 

# plot graph 1
    plot(
        x = time, 
        y = act.power, 
        type = "l", 
        xlab = "", 
        ylab = "Global Active Power", 
        cex=0.2
    )
    
# plot graph 2
    plot(
        time, 
        voltage, 
        type="l", 
        xlab="datetime", 
        ylab="Voltage"
    )
    
# plot graph 3
    plot(
        time,
        black.line, 
        type="l", 
        ylab="Energy Submetering", 
        xlab=""
    )
    lines(
        time, 
        red.line, 
        type="l", 
        col="red"
    )
    lines(
        time, 
        blue.line, 
        type="l", 
        col="blue"
    )
    
    legend(
        "topright", 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty=1, 
        lwd=2,
        bty = "n",
        col=c("black", "red", "blue")
    )
    
# plot graph 4
    plot(
        time,
        react.power,
        type = "l",
        xlab="datetime", 
        ylab="Global_reactive_power"
    )

# close graphics device
    dev.off()

    