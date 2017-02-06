# Sub meter readings timeline

  if (!exists("hec"))
  {
    source("Fetch.R")
  }
  
  png(file="Plot3.png",width = 480,height=480)
  
  plot(strptime(paste(as.character(plt_Data$Date),as.character(plt_Data$Time)),format="%Y-%m-%d %H:%M:%S")
       ,plt_Data$Sub_metering_1
       ,type="l"
       ,ylim=range(c(plt_Data$Sub_metering_1,plt_Data$Sub_metering_2,plt_Data$Sub_metering_3))
       ,xlab=""
       ,ylab="Energy Sub Metering"
       )
  par(new=TRUE)
  points(strptime(paste(as.character(plt_Data$Date),as.character(plt_Data$Time)),format="%Y-%m-%d %H:%M:%S")
         ,plt_Data$Sub_metering_2
         ,type="l"
         ,col="red")
  points(strptime(paste(as.character(plt_Data$Date),as.character(plt_Data$Time)),format="%Y-%m-%d %H:%M:%S")
         ,plt_Data$Sub_metering_3
         ,type="l"
         ,col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
                    ,col=c("black","red","blue")
                    ,lty=1)
  par(new=FALSE)
  dev.off()
