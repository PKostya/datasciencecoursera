temp<- read.table("c:\\temp\\household_power_consumption.txt", sep=";", header = T, stringsAsFactors=F)
library(dplyr)
temp2<-tbl_df(temp)
temp2$Date<-as.Date(temp2$Date, "%d/%m/%Y")
temp2<- filter(temp2, Date >= "2007-02-01"& Date <="2007-02-02")

hist(as.numeric(temp2$Global_active_power), col="red", xlab=c("Global ACtive Power (kilowatts)"),
     main = c("Global Active Power"))
