# Variables for working with directory.
directory <- "./Data"
if (!file.exists(directory)) {
    dir.create(directory)
}

# To download data from provided URL.
fileZipName <- "epc.zip"
destFile <- file.path(directory, fileZipName)
fileURL <-
    "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if (!file.exists(paste(destFile))) {
    download.file(fileURL, destfile = destFile, method = "curl")
    dateDownloaded <- date()
}

# To unzip the downloaded data.
zipF <- file.path(directory, fileZipName)
outDir <- file.path(directory, "epc")
unzip(zipF, exdir = outDir)

# To load the downloaded data.
fileName <- "household_power_consumption.txt"
filePath <- file.path(outDir, fileName)
fileData <- read.table(
    filePath,
    sep = ";",
    header = TRUE,
    na.strings = "?",
    colClasses = c("character", "character", rep("numeric", 7)),
)

# To subset only Dates to use from all data.
df <-
    subset(fileData,
           fileData$Date == "1/2/2007" |
               fileData$Date == "2/2/2007")
