plot2 <- function() {

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

      png(file = "plot2.png")

      ## Plot time vs. Global Active Power converted to numeric class with formatting.
      ## Close graphics device.

      plot(daytime, as.numeric(hedc$Global_active_power), type = "l", 
           ylab = "Global Active Power (kilowatts)", xlab = "")
      dev.off()

      ## Should produce a "plot2.png" file in the working directory.
      
      print("plot2.png Complete")
}