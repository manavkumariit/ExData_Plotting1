# Global Active Power timeline

if (!exists("hec"))
{
  source("Fetch.R")
}

png(file="Plot2.png",width = 480,height=480)
plot(strptime(paste(as.character(plt_Data$Date),as.character(plt_Data$Time)),format="%Y-%m-%d %H:%M:%S")
     ,plt_Data$Global_active_power
     ,type="l"
     ,ylab="Global Active Power (Kilowatts)"
     ,xlab=""
     ,main="")
dev.off()