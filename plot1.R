plot1 <- function() {   
      
      ## "household_power_consumption.txt" file saved in working directory.
      ## read data into a data frame (as characters with ; seporator), 
      ## subset by each date, combine subsets.

      hed <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                        na.strings = "?", colClasses = "character")
      heda <- hed[hed$Date == "1/2/2007", ]
      hedb <- hed[hed$Date == "2/2/2007", ]
      hedc <- rbind(heda, hedb)

      ## Data ready to plot. 
      ## Call the PNG graphics device.

      png(file = "plot1.png")

      ## Plot histogram of Global Active Power converted to numeric class
      ## with formatting and close graphics device.

      hist(as.numeric(hedc$Global_active_power), col = "red", 
           xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
      dev.off()

      ## Should produce a "plot1.png" file in the working directory.
      
      print("plot1.png Complete")
}