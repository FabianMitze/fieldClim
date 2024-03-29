% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/radiation.R
\name{rad_lw_out}
\alias{rad_lw_out}
\alias{rad_lw_out.numeric}
\alias{rad_lw_out.weather_station}
\title{Longwave radiation of the surface}
\usage{
rad_lw_out(...)

\method{rad_lw_out}{numeric}(t_surface, surface_type = "field", ...)

\method{rad_lw_out}{weather_station}(weather_station, surface_type = "field", ...)
}
\arguments{
\item{...}{Additional parameters passed to later functions.}

\item{t_surface}{Surface temperature in °C.}

\item{surface_type}{Surface type for which a specific emissivity will be selected.
Default is 'field' as surface type.}

\item{weather_station}{Object of class weather_station.}
}
\value{
Emissions in W/m².
}
\description{
Calculates emissions of a surface.
}
\details{
If a weather_station object is given, the lower air temperature will be used
instead of the surface temperature.
}
