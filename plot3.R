
# read txt file into data frame
    power.comp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")

# subset data based on dates 1/2/2007 and 2/2/2007
    power.comp <- power.comp[power.comp$Date %in% c("1/2/2007", "2/2/2007"),]

# combine date and time columns in new variable and convert to time class
    time <- paste(power.comp$Date, power.comp$Time, sep=" ")
    time <- strptime(time, "%d/%m/%Y %H:%M:%S")

# extract meters for ploting
    black.line <- power.comp$Sub_metering_1
    red.line <- power.comp$Sub_metering_2
    blue.line <- power.comp$Sub_metering_3

# make png 480x480 pixels
    png("plot3.png", width=480, height=480)

# make graph
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

# add legend
    legend(
        "topright", 
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        lty=1, 
        lwd=2.5, 
        col=c("black", "red", "blue"), 
        cex = 0.75
    )

# close graphics device
    dev.off()
