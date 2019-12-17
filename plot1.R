
# Name: Guilherme de Araujo

# Library
library(data.table)
library(tibble)

# Create Repository
if (!file.exists("coletadados")) { 
          dir.create("coletadados")           
} 

# Download Dataset
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile = "coletadados/dados.zip") 
          
# Unzip Dataset
unzip("coletadados/dados.zip", exdir = "coletadados")

# Load Data
plot1 <- read.table("coletadados/household_power_consumption.txt", header = TRUE, sep = ";")

# Numeric
plot1$Global_active_power <- as.integer(plot1$Global_active_power)

# Create Hist
hist(plot1$Global_active_power, main="Global active power", xlab = "Global active power (Kilowatts)",col= "red")

# PNG
png("plot1.png", width=480, height= 480)

