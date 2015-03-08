par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(x=Date_time, y=as.numeric(temp2$Global_active_power), type='l',
     xlab=c(""), ylab=c("Global ACtive Power (kilowatts)"))
plot(x=Date_time, y=as.numeric(temp2$Voltage), type='l',
     xlab=c("datetime"), ylab=c("Voltage"))

plot(x=Date_time, y=as.numeric(temp2$Sub_metering_1), type='l',
     xlab=c(""), ylab=c("Energy sub metering"))
lines(x=Date_time, y=as.numeric(temp2$Sub_metering_2), type='l',col="red")
lines(x=Date_time, y=as.numeric(temp2$Sub_metering_3), type='l', col="blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(x=Date_time, y=as.numeric(temp2$Global_reactive_power), type='l',
     xlab=c("datetime"), ylab=c("Global_reactive_power"))