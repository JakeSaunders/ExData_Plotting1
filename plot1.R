
# read txt file into data frame
    power.comp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")

# subset data based on dates 1/2/2007 and 2/2/2007
    power.comp <- power.comp[power.comp$Date %in% c("1/2/2007", "2/2/2007"), ]

# make png 480x480 pixels
    png("plot1.png", width=480, height=480)
    
# histogram of Global active power
    hist(
        as.numeric(power.comp$Global_active_power), 
        col = "Red", 
        xlab="Global Active Power (kilowatts)",
        main="Global Active Power"
    )

# close graphics device
    dev.off()
    