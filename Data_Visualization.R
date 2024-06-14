#install libraries
install.packages("quantmod")
install.packages("ggplot2")
install.packages("forecast")
install.packages("tseries")
install.packages("rugarch")
install.packages("prophet")
install.packages("tsfknn")

#load packages
library(quantmod)
library(ggplot2)
library(forecast)
library(tseries)
library(rugarch)
library(prophet)
library(tsfknn)

#data extraction and stock market indicators
getSymbols("^GSPC",src="yahoo",from="2015-01-01",to = "2020-06-04")
date = index(GSPC)
date = as.Date(date)
head(GSPC)
chartSeries(GSPC,TA = NULL)
chartSeries(GSPC,TA=c(addVo(),addBBands(),addMACD()))

#ADF TEST 
print(adf.test(GSPC$GSPC.Close))

#plot ACF and PACF
par(mfrow = c(1, 2))
acf(GSPC$GSPC.Close)
pacf(GSPC$GSPC.Close)
par(mfrow = c(1, 1))