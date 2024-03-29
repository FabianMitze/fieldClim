% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/weather_station.R
\name{build_weather_station}
\alias{build_weather_station}
\title{Weather Station}
\usage{
build_weather_station(
  lat,
  lon,
  elev,
  surface_type = "field",
  obs_height = 0.3,
  z1,
  z2,
  datetime,
  t1,
  t2,
  v1,
  v2,
  hum1,
  hum2,
  p1 = NULL,
  p2 = NULL,
  sw_in = NULL,
  sw_out = NULL,
  lw_in = NULL,
  lw_out = NULL,
  soil_flux = NULL,
  ...
)
}
\arguments{
\item{lat}{Latitude of location. Preset: 50.840503 (climate station Caldern, Germany).}

\item{lon}{Longitude of location. Preset: 8.683300 (climate station Caldern, Germany).}

\item{elev}{Elevation of location above sea level in m. Preset: 270 m (climate station Caldern, Germany).}

\item{surface_type}{Surface Type. Form: Character string. One of: "field", "acre", "lawn", "street", "agriculture", "settlement", "coniferous forest", "deciduous forest", "mixed forest", "city", Preset: "field".}

\item{obs_height}{Height of vegetation in m. Preset: 0.3.}

\item{z1}{Lower measurement height in m. Preset:  2m.}

\item{z2}{Upper measurement height in m. Preset: 10m.}

\item{datetime}{Name of datetime-coloumn in data.
Form: POSIX-Object (See \link[base:as.POSIXlt]{base::as.POSIXlt} and \link[base:strptime]{base::strptime} for conversion.)}

\item{t1}{Vector containing temperature data in °C of the lower point of measurement.}

\item{t2}{Vector containing temperature data in °C of the upper point of measurement.}

\item{v1}{Vector containing wind speed data in m/s of the lower point of measurement.}

\item{v2}{Vector containing wind speed data in m/s of the upper point of measurement.}

\item{hum1}{Vector containing humidity data in \% of the lower point of measurement.}

\item{hum2}{Vector containing humidity data in \% of the upper point of measurement.}

\item{p1}{Vector containing pressure data in hPa of the lower point of measurement.}

\item{p2}{Vector containing pressure data in hPa of the upper point of measurement.}

\item{sw_in}{Vector containing incoming shortwave radiation in W/m².}

\item{sw_out}{Vector containing outgoing shortwave radiation in W/m².}

\item{lw_in}{Vector containing incoming longwave radiation in W/m².}

\item{lw_out}{Vector containing outgoing shortwave radiation in W/m².}

\item{soil_flux}{Vector containing soil flux in W/m².}

\item{...}{Additional parameters, see details for usage.}
}
\value{
List of class "weather_station", that contains:
\enumerate{
\item list of location properties
\item list of weather station properties
\item list of measurements, which will contain NULLs if they were not defined in the input
}
}
\description{
Creates a list of class "weather_station", that contains all data regarding the
weather station, its location and its measurements.
}
\details{
Parameters with preset NULL can be estimated using calculations. However some additional
variables need to be passed for the estimation of some parameters.
For usage examples see the examples below.

If p1 and p2 are NULL, they will be estimated using the elevation and air temperature.

If sw_in is NULL, it will be estimated using TOA radiation and average
atmospheric transmittance (see \link{rad_sw_in}).
By setting slope, sky_view and exposition, sw_in will be topographically corrected
(see \link{rad_sw_in_topo}).

If sw_out is NULL, sw_in and albedo or sw_in and surface_type need to be set (see \link{rad_sw_out}).

If lw_in is NULL, it will be estimated using the air temperature and relative humidity
(see \link{rad_lw_in}).
By setting sky_view, lw_in will be topographically corrected
(see \link{rad_lw_in_topo}).

If lw_out is NULL, t_surface needs to be set (see \link{rad_lw_out}).

If soil_flux is NULL, ts1, ts2, depth1, depth2, moisture and texture need to be set.
(see \link{soil_heat_flux} and \link{soil_thermal_cond}).

If additional parameters are desired, they can be commited:
\itemize{
\item location properties: "slope", "sky_view", "exposition", "texture" and "albedo".
\item depth of ground measurements: "depth1" and "depth2" in m.
\item additional measurements: "ts1", "ts2" and "t_surface" in °C and "moisture".
}
}
\examples{
\dontrun{
# Standard parameters
test_station <- build_weather_station(lat = 50.840503,
                                      lon = 8.6833,
                                      elev = 270,
                                      surface_type = "field",
                                      obs_height = 0.3, # obstacle height
                                      z1 = 2, # measurement heights
                                      z2 = 10,
                                      datetime = ws$datetime,
                                      t1 = ws$t1, # temperature
                                      t2 = ws$t2,
                                      v1 = ws$v1, # windspeed
                                      v2 = ws$v2,
                                      hum1 = ws$hum1, # humidity
                                      hum2 = ws$hum2,
                                      sw_in = ws$rad_sw_in, # shortwave radiation
                                      sw_out = ws$rad_sw_out,
                                      lw_in = ws$rad_lw_in, # longwave radiation
                                      lw_out = ws$rad_lw_out,
                                      soil_flux = ws$heatflux_soil)
# Specify pressure
test_station <- build_weather_station(lat = 50.840503,
                                      lon = 8.6833,
                                      elev = 270,
                                      surface_type = "field",
                                      obs_height = 0.3,
                                      z1 = 2,
                                      z2 = 10,
                                      datetime = ws$datetime,
                                      t1 = ws$t1,
                                      t2 = ws$t2,
                                      v1 = ws$v1,
                                      v2 = ws$v2,
                                      hum1 = ws$hum1,
                                      hum2 = ws$hum2,
                                      sw_in = ws$rad_sw_in,
                                      sw_out = ws$rad_sw_out,
                                      lw_in = ws$rad_lw_in,
                                      lw_out = ws$rad_lw_out,
                                      soil_flux = ws$heatflux_soil,
                                      # commit pressure values
                                      p1 = ws$p1,
                                      p2 = ws$p2)

# Alternative calculation of soil flux
test_station <- build_weather_station(lat = 50.840503,
                                      lon = 8.6833,
                                      elev = 270,
                                      surface_type = "field",
                                      obs_height = 0.3,
                                      z1 = 2,
                                      z2 = 10,
                                      datetime = ws$datetime,
                                      t1 = ws$t1,
                                      t2 = ws$t2,
                                      v1 = ws$v1,
                                      v2 = ws$v2,
                                      hum1 = ws$hum1,
                                      hum2 = ws$hum2,
                                      sw_in = ws$rad_sw_in,
                                      sw_out = ws$rad_sw_out,
                                      lw_in = ws$rad_lw_in,
                                      lw_out = ws$rad_lw_out,
                                      # alternative soil flux:
                                      depth1 = 0,
                                      depth2 = 0.3,
                                      ts1 = ws$t_surface,
                                      ts2 = ws$ts1,
                                      moisture = ws$water_vol_soil,
                                      texture = "clay")
# Alternative shortwave
test_station <- build_weather_station(lat = 50.840503,
                                      lon = 8.6833,
                                      elev = 270,
                                      surface_type = "field",
                                      obs_height = 0.3,
                                      z1 = 2,
                                      z2 = 10,
                                      datetime = ws$datetime,
                                      t1 = ws$t1,
                                      t2 = ws$t2,
                                      v1 = ws$v1,
                                      v2 = ws$v2,
                                      hum1 = ws$hum1,
                                      hum2 = ws$hum2,
                                      lw_in = ws$rad_lw_in,
                                      lw_out = ws$rad_lw_out,
                                      soil_flux = ws$heatflux_soil,
                                      # Alternative shortwave radiation:

                                      # Topographic correction
                                      slope = 10, # In degrees
                                      exposition = 20, # North = 0, South = 180
                                      sky_view = 0.82 # Sky view factor (0-1)
)

# Alternative longwave
test_station <- build_weather_station(lat = 50.840503,
                                      lon = 8.6833,
                                      elev = 270,
                                      surface_type = "field",
                                      obs_height = 0.3,
                                      z1 = 2,
                                      z2 = 10,
                                      datetime = ws$datetime,
                                      t1 = ws$t1,
                                      t2 = ws$t2,
                                      v1 = ws$v1,
                                      v2 = ws$v2,
                                      hum1 = ws$hum1,
                                      hum2 = ws$hum2,
                                      sw_in = ws$rad_sw_in,
                                      sw_out = ws$rad_sw_out,
                                      soil_flux = ws$heatflux_soil,
                                      # alternative longwave radiation:
                                      t_surface = ws$t_surface,
                                      # Topographic correction
                                      sky_view = 0.82 # Sky view factor (0-1)
)

}
}
