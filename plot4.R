# To read data from read data file.
source("read_data.R")

# To load required library.
library(lubridate)

# To open device for printing plot
png("figure/plot4.png", width = 480, height = 480)

# To adjust number of rows in plot frame
par(mfrow = c(2, 2))


df <- mutate(df, DT = paste(df$Date, df$Time))
df$DT <- dmy_hms(df$DT)

# To create first
plot(
    df$DT,
    df$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power(Kilowatts)"
)

# To create second
plot(df$DT,
     df$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# To create third
plot(
    df$DT,
    df$Sub_metering_1,
    type = "l",
    xlab = "",
    ylab = "Energy sub metering"
)

lines(df$DT, df$Sub_metering_2, col = "red")
lines(df$DT, df$Sub_metering_3, col = "blue")
legend(
    "topright",
    col = c("black", "red", "blue"),
    c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lty = 1
)

# To create Fourth
plot(
    df$DT,
    df$Global_reactive_power,
    type = "l",
    xlab = "datetime",
    ylab = "Global_reactive_power"
)

# To close png device buffer
dev.off()
