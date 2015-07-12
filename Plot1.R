


png(filename="plot1.png", height=480, width=480)

par(mfrow = c(1,1))

### Read the data of the required days

asdate <- function(from) as.Date(from, format="%d/%m/%Y")
setClass('dmY')
setAs("character","dmY", asdate )

table <- read.csv("household_power_consumption.txt", nrows = 100000, sep=";", 
        na.strings = "?",
        colClasses=c("dmY","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),)

tableReqDays <- table[(table$Date >='2007-02-01' & table$Date <='2007-02-02'),]

### Plot the histogram of the global active power values distribution

hist(tableReqDays$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",
        ylab="Frequency", col="red")     

dev.off()
