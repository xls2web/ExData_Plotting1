# upload and apply the date and time class to $Date and $Time
df <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?")

df$Date<-as.Date(df$Date,"%d/%m/%Y")
df1<-df[df$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]
df1$Time<-strptime(paste(as.character(df1$Date),df1$Time),"%Y-%m-%d %H:%M:%S")

# create the plot
png(filename="plot2.png",width=480,height=480,bg="transparent",units="px")

png("plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
with(df1,plot(Time,Global_active_power,
              xlab="",
              ylab="Global Active Power (kilowatts)",
              type="l"))
dev.off()