plot3 <- function() {

      ## "household_power_consumption.txt" file saved in working directory.
      ## read data into a data frame (as characters with : seporator), 
      ## subset by each date, combine subsets.

      hed <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                        na.strings = "?", colClasses = "character")
      heda <- hed[hed$Date == "1/2/2007", ]
      hedb <- hed[hed$Date == "2/2/2007", ]
      hedc <- rbind(heda, hedb)

      ## Create day and time vectors, convert them together into vector with POSIXct class

      day <- as.Date(hedc$Date, format = "%d/%m/%Y")
      time <- hedc$Time
      daytime <- as.POSIXct(paste(day, time), format="%Y-%m-%d %H:%M:%S")

      ## Data ready to plot. 
      ## Call the PNG graphics device. 

      png(file = "plot3.png")

      ## Create empty plot with formatting.
      ## Plot points: time vs. each Sub_metering variable converted to numeric class. 
      ## Add legend and close graphics device.

      plot(daytime, as.numeric(hedc$Sub_metering_1), type = "n", 
           ylab = "Energy sub metering", xlab = "")
      points(daytime, as.numeric(hedc$Sub_metering_1), type = "l")
      points(daytime, as.numeric(hedc$Sub_metering_2), type = "l", col = "red")
      points(daytime, as.numeric(hedc$Sub_metering_3), type = "l", col = "blue")
      legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
             col = c("black", "red", "blue"), lwd = 1)
      dev.off()

      ## Should produce a "plot3.png" file in the working directory.

      print("plot3.png Complete")
}