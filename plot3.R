
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
dados  <- read.table("coletadados/household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

dados_finais <- dados[dados$Date %in% c("1/2/2007", "2/2/2007"),] ; tempo<-strptime(paste(dados_finais$Date, dados_finais$Time, sep=""), "%d/%m/%Y %H:%M:%S")

dados_finais <- cbind(tempo, dados_finais)

# Plot
cores <- c("black", "black", "black")

etiquetas <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

plot(dados_finais$tempo, dados_finais$Sub_metering_1, type= "l", col=cores[1], xlab="", ylab= "Energy sub metering")

lines(dados_finais$tempo, dados_finais$Sub_metering_2, col=cores[2])

lines(dados_finais$tempo, dados_finais$Sub_metering_3, col=cores[3])

legend("topright", legend=etiquetas, col=cores, lty="solid")

# Export PNG
png("plot3.png", width = 480, height = 480)

