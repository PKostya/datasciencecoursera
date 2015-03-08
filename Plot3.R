temp<- read.table("c:\\temp\\household_power_consumption.txt", sep=";", header = T, stringsAsFactors=F)
library(dplyr)
temp2<-tbl_df(temp)
temp2$Date<-as.Date(temp2$Date, "%d/%m/%Y")
temp2<- filter(temp2, Date >= "2007-02-01"& Date <="2007-02-02")

plot(x=Date_time, y=as.numeric(temp2$Sub_metering_1), type='l',
     xlab=c(""), ylab=c("Energy sub metering"))
lines(x=Date_time, y=as.numeric(temp2$Sub_metering_2), type='l',col="red")
lines(x=Date_time, y=as.numeric(temp2$Sub_metering_3), type='l', col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
