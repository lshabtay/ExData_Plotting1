


png(filename="plot3.png", height=480, width=480)

par(mfrow = c(1,1))


### Read the data of the required days

asdate <- function(from) as.Date(from, format="%d/%m/%Y")
setClass('dmY')
setAs("character","dmY", asdate )

table <- read.csv("household_power_consumption.txt", nrows = 100000, sep=";", 
        na.strings = "?",
        colClasses=c("dmY","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),)


tableReqDays <- table[(table$Date >='2007-02-01' & table$Date <='2007-02-02'),]


tableReqDays$t <- strptime(paste(tableReqDays$Date,tableReqDays$Time),format="%Y-%m-%d %H:%M:%S")



### Plot the sub-metering graphs as a function of time

plot(tableReqDays$t, tableReqDays$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")

lines(tableReqDays$t,tableReqDays$Sub_metering_2,type="l",col="red")

lines(tableReqDays$t,tableReqDays$Sub_metering_3,type="l",col="blue")

legend(x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lwd = 2)


dev.off()

