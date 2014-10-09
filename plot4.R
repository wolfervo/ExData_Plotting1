plot4 <- function() {
      

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
      ## Call the PNG graphics device and set panels to 2 rows and 2 columns

      png(file = "plot4.png")
      par(mfrow = c(2, 2))

      ## Upper left pane:
      ## Plot time vs. Global Active Power converted to numeric class with formatting.

      plot(daytime, as.numeric(hedc$Global_active_power), type = "l", 
           ylab = "Global Active Power", xlab = "")

      ## Upper right pane:
      ## Plot time vs. Voltage converted to numeric class with formatting.

      plot(daytime, as.numeric(hedc$Voltage), type = "l", ylab = "Voltage", 
           xlab = "datetime")

      ## Lower left pane:
      ## Create empty plot with formatting.
      ## Plot points: time vs. each Sub_metering variable converted to numeric class. 
      ## Add legend and close graphics device.

      plot(daytime, as.numeric(hedc$Sub_metering_1), type = "n", 
           ylab = "Energy sub metering", xlab = "")
      points(daytime, as.numeric(hedc$Sub_metering_1), type = "l")
      points(daytime, as.numeric(hedc$Sub_metering_2), type = "l", col = "red")
      points(daytime, as.numeric(hedc$Sub_metering_3), type = "l", col = "blue")
      legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
             col = c("black", "red", "blue"), lwd = 1, bty = "n")

      ## Lower right pane:
      ## Plot time vs. Global Reactive Power converted to numeric class with formatting.

      plot(daytime, as.numeric(hedc$Global_reactive_power), type = "l", 
           ylab = "Global_reactive_power", xlab = "datetime")

      ## Close graphics device.

      dev.off()

      ## Should produce a "plot4.png" file in the working directory.
      
      print("plot4.png Complete")
}