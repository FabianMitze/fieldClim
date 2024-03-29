% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/soil.R
\name{soil_attenuation}
\alias{soil_attenuation}
\alias{soil_attenuation.numeric}
\alias{soil_attenuation.weather_station}
\title{Soil attenuation length}
\usage{
soil_attenuation(...)

\method{soil_attenuation}{numeric}(thermal_cond, vol_heat_cap, ...)

\method{soil_attenuation}{weather_station}(weather_station, ...)
}
\arguments{
\item{...}{Additional parameters passed to later functions.}

\item{thermal_cond}{Thermal conductivity of soil in W/m K.}

\item{vol_heat_cap}{Volumetric heat capacity of soil in J/(m³ * K).}

\item{weather_station}{Object of class weather_station.}
}
\value{
Soil attenuation length in m.
}
\description{
Calculates soil attenuation length.
}
