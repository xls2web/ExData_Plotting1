# upload and apply the date and time class to $Date and $Time
df <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?")

df$Date<-as.Date(df$Date,"%d/%m/%Y")
df1<-df[df$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]
df1$Time<-strptime(paste(as.character(df1$Date),df1$Time),"%Y-%m-%d %H:%M:%S")


# create the plot
png("plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
with(df1, plot(Time,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering"))
with(df1, lines(Time,Sub_metering_2,type="l",col="red"))
with(df1, lines(Time,Sub_metering_3,type="l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()