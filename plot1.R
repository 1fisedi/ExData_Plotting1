# To read data from read data file.
source("read_data.R")


# To open device for printing plot
png("figure/plot1.png", width = 480, height = 480)

# To adjust number of rows in plot frame
par(mfrow = c(1, 1))

# To create first plot
hist(
    df$Global_active_power,
    col = "Red",
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)",
    ylab = "Frequency"
)

# To close png device buffer
dev.off()
