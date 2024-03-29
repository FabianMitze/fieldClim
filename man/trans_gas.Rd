% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/transmittance.R
\name{trans_gas}
\alias{trans_gas}
\alias{trans_gas.numeric}
\alias{trans_gas.weather_station}
\title{Transmittance due to gas}
\usage{
trans_gas(...)

\method{trans_gas}{numeric}(air_mass_abs, ...)

\method{trans_gas}{weather_station}(weather_station, ...)
}
\arguments{
\item{...}{Additional parameters passed to later functions.}

\item{air_mass_abs}{Absolute optical air mass.}

\item{weather_station}{Object of class weather_station.}
}
\value{
Transmittance due to gas (0-1)
}
\description{
Calculates transmittance due to O$\emph{{2}$ and CO$}{2}$.
}
