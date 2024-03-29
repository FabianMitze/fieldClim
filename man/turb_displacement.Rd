% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/turbulence.R
\name{turb_displacement}
\alias{turb_displacement}
\alias{turb_displacement.numeric}
\alias{turb_displacement.weather_station}
\title{Displacement height}
\usage{
turb_displacement(...)

\method{turb_displacement}{numeric}(obs_height, surroundings = "vegetation", ...)

\method{turb_displacement}{weather_station}(weather_station, surroundings = "vegetation", ...)
}
\arguments{
\item{...}{Additional parameters passed to later functions.}

\item{obs_height}{Height of vegetation in m.}

\item{surroundings}{Choose either 'vegetation' or 'city'.}

\item{weather_station}{Object of class weather_station}
}
\value{
Displacement height in m.
}
\description{
Calculate the displacement height, caused by an obstacle (e.g. a crop field).
Works for vegetation only.
}
