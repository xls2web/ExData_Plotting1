df <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?")

df$Date<-as.Date(df$Date,"%d/%m/%Y")
df1<-df[df$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]
df1$Time<-strptime(paste(as.character(df1$Date),df1$Time),"%Y-%m-%d %H:%M:%S")


png("plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
hist(df1$Global_active_power, 
     col="red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)" 
)
dev.off()