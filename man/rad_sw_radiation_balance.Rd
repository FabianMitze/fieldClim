% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/radiation.R
\name{rad_sw_radiation_balance}
\alias{rad_sw_radiation_balance}
\alias{rad_sw_radiation_balance.numeric}
\alias{rad_sw_radiation_balance.weather_station}
\title{Shortwave radiation balance}
\usage{
rad_sw_radiation_balance(...)

\method{rad_sw_radiation_balance}{numeric}(rad_sw_ground_horizontal, rad_sw_reflected, ...)

\method{rad_sw_radiation_balance}{weather_station}(weather_station, ...)
}
\arguments{
\item{...}{Additional parameters passed to later functions.}

\item{rad_sw_ground_horizontal}{Shortwave radiation on the ground onto a horizontal area in W/m^2.}

\item{rad_sw_reflected}{Reflected shortwave radiation in W/m².}

\item{weather_station}{Object of class weather_station.}
}
\value{
Shortwave radiation balance in W/m².
}
\description{
Calculation of the shortwave radiation balance.
}
