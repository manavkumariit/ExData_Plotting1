# Global Active Power Histogram
if (!exists("hec"))
{
  source("Fetch.R")
}

png(file="Plot1.png",width = 480,height=480)

hist(plt_Data$Global_active_power
      ,col="red"
     ,xlab = "Global Active Power (Kilowatts)"
     ,ylab = "Frequency"
     ,main="Global Active Power")

dev.off()