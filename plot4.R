
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

etiquetas <- c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") ; cor <- c( "black", "black", "black")

par(mfrow=c(2,2))

plot(dados_finais$tempo, dados_finais$Global_active_power, type= "l", col= "black", xlab= "", ylab= "Global Active Power")

plot(dados_finais$tempo, dados_finais$Voltage, type= "l", col= "black", xlab= "datetime", ylab= "Voltage")

plot(dados_finais$tempo, dados_finais$Sub_metering_1, type= "l", xlab="", ylab= "Energy sub metering") ; lines(dados_finais$tempo, dados_finais$Sub_metering_2, type= "l", col= "black")

lines(dados_finais$tempo, dados_finais$Sub_metering_3, type= "l", col= "black") ; legend( "topright", bty= "n", legend=etiquetas, lty=1, col=cor)

plot(dados_finais$tempo, dados_finais$Global_reactive_power, type= "l", col= "black", xlab= "datetime", ylab= "Global_reactive_power")

# Export PNG
png("plot4", width = 480, height = 480)

