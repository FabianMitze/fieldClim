% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/temperature.R
\name{temp_pot_temp}
\alias{temp_pot_temp}
\alias{temp_pot_temp.numeric}
\alias{temp_pot_temp.weather_station}
\title{Potential Temperature}
\usage{
temp_pot_temp(...)

\method{temp_pot_temp}{numeric}(t, p, ...)

\method{temp_pot_temp}{weather_station}(weather_station, height = "lower", ...)
}
\arguments{
\item{...}{Additional parameters passed to later functions.}

\item{t}{Temperature in °C.}

\item{p}{Pressure in hPa.}

\item{weather_station}{Object of class weather_station.}

\item{height}{Height of measurement, either "upper" or "lower".}
}
\value{
Potential temperature in °C.
}
\description{
Calculation of the potential air temperature.
}
