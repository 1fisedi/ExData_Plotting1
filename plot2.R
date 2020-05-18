# To read data from read data file.
source("read_data.R")

# To load required library.
library(lubridate)

# To open device for printing plot
png("figure/plot2.png", width = 480, height = 480)

# To adjust number of rows in plot frame
par(mfrow = c(1, 1))

# To prepare data.
df <- mutate(df, DT = paste(df$Date, df$Time))
df$DT <- dmy_hms(df$DT)

# To create second plot.
plot(
    df$DT,
    df$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power(Kilowatts)"
)

# To close png device buffer
dev.off()
