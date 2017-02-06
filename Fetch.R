
# If the file has not been downloaded, Get it form the web and unzip it
get_data <- function(){
  if (!file.exists("hec.zip")){
    url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url,destfile = "hec.zip")
    unzip("hec.zip")  
  }
  else {
    print("File already exists. skipping download")
  }
}

# Function to load the downloaded file to environment
hec_data <- function (){
    hec_data <- read.delim("household_power_consumption.txt",sep=";")
}

# setup the global variables for using in the plots
get_data()
if (!exists("hec"))
{
  hec <- hec_data()
  print("Before Cleaning Data")
  str(hec)
  hec <- mutate(hec,Date = as.Date(strptime(Date,format="%d/%m/%Y"))
                    ,Global_active_power = as.numeric(as.character(Global_active_power))
                    ,Global_reactive_power = as.numeric(as.character(Global_reactive_power))
                    ,Voltage = as.numeric(as.character(Voltage))
                    ,Sub_metering_1 = as.numeric(as.character(Sub_metering_1))
                    ,Sub_metering_2 = as.numeric(as.character(Sub_metering_2))
                    ,Sub_metering_3 = as.numeric(as.character(Sub_metering_3))
                    ,Global_intensity = as.numeric(as.character(Global_intensity))
                )
  print("After Cleaning Data")
  str(hec)
  plt_Data <- filter(hec,Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))
}else {
  print("Data already loaded to Env. Skipping.")
}