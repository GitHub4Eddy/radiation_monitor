# radiation_monitor
The Radiation Monitor collects radiation levels from all available stations around the world and shows 5 nearest stations to your location and one station with highest current readings and one station with the highest 24 hour average readings. The QuickApp uses the location (latitude and ongitude) of your Homecenter to measure the distance to the stations and to get the nearest stations. The bearings in degrees from your location to the stations is shown. Next to the measurements, the five nearest reactors are shown. The languages English, French, Polish and Duth are supported. 
 
Thanks to @Sankotronic for his work for his HC2 Virtual Device version and ideas. 
 
The main device shows the nearest measurement μSv/h. There are Child Devices for:
- Nearest sensor 24h average μSv/h
- 2nd, 3rd, 4th, 5th nearest sensor measurement with the 24 average in the log text
- Nearest maximum measurement
- Nearest maximum 24h average measurement
 
The nearest five reactors are retrieved once at startup of the QuickApp or at the next interval if you click on the button. 

Radioactive@Home is a Polish science project using the distributed computing capabilities of the BOINC platform. The main goal of the project is to create a free and continuously updated map of radiation levels available for everyone, by gathering information about gamma radiation using sensors connected to the computers of volunteers willing to participate in the project. Project is completely non-commercial, participating will be free of charge (excluding cost of detector) and the software will be licensed under the GNU General Public License (GPL).
 
μSv/h: The sievert (symbol: Sv) is a unit in the International System of Units (SI) intended to represent the stochastic health risk of ionizing radiation.
 
In land navigation, a 'bearing' is ordinarily calculated in a clockwise direction starting from a reference direction of 0° and increasing to 359.9 degrees. Measured in this way, a bearing is referred to as an azimuth by the US Army but not by armies in other English speaking nations, which use the term bearing.
 
The human population is continuously exposed to ionizing radiation from several natural sources (cosmic and terrestrial contributions). For most individuals, exposure to natural sources exceeds that from all man-made (artificial) sources combined. The man-made sources arise from peaceful (e.g. medical use, energy generation, and associated fuel cycle facilities, radioisotope production, waste management) and military purposes (nuclear tests and their fallout or radioactive release, nuclear explosions).
 
Radiation levels: 
- Green: Radiation up to 0.3 μSv/h
- Yellow: Radiation between 0.3 and 0.8 μSv/h 
- Red: Radiation above 0.8 μSv/h
 
1.14 µSv/h - Shelter population
5.7 µSv/h - Evacuation of population
11.4 µSv/h - Issue Iodine tablets
0.114 µSv/h - Max daily dose == 1 mSv/year
 
Reverse Geocoding by Nominatim
Reverse geocoding generates an address from a latitude and longitude. The reverse geocoding API does not exactly compute the address for the coordinate it receives. It works by finding the closest suitable OSM object and returning its address information. This may occasionally lead to unexpected results. 

QuickApp code logics:
- onInit() Initialise the QuickApp
- getQuickAppVariables() Get all Quickapp Variables or create them
- createVariables() Setup the global variables
- setupChildDevices() -- Setup all child devices
- loadMap() Get the webpage from http://radioactiveathome.org/map/ (This is the main loop of the QuickApp)
- extractData() Extract the data from the webpage source-code
- geoDistance() Calculate the distance from the HC3 (QuickApp variables) lat/lon to the sensors lat/lon
- geoBearing() Calculate the bearing from the HC3 (QuickApp variables) lat/lon to the sensors lat/lon
- Check for the values to give the right dot colours for the sample and average measurements
- Store the values of all sensors in a table and sort the table on distance
- Run through the table to get the maximum sample and maximum average measurements. If there are more than one, get the one that is the nearest-by
- updateIcon() Set the icon (colour) based on the sensor measurement
- getCity() Get the cities and countries for the seven selected sensors from https://nominatim.openstreetmap.org/ and store them in a table
- updateLabels() Update the labels
- updateProperties() Update the properties
- updateChildDevices() Update the Child Devices
- Return to the main loop loadMap()
 
Links:
- Radioactive@Home Map: http://radioactiveathome.org/map/
- Status servers: http://radioactiveathome.org/boinc/server_status.php
- Reverse geocoding: https://nominatim.org/release-docs/latest/api/Reverse/ licence:Data © OpenStreetMap contributors, ODbL 1.0. https://osm.org/copyright
- Nominatim Usage Policy (aka Geocoding Policy): https://operations.osmfoundation.org/policies/nominatim/

Variables (mandatory and created automatically): 
- latitude = Latitude of your location (Default is the latitude of your HC3)
- longitude = Longitude of your location (Default is the longitude of your HC3)
- language = Preferred language (default = en) (supported languages are French (fr), Polish (pl) and Dutch (nl))
- interval = Interval in seconds to get the data from the Radioactive@Home website
- debugLevel = Number (1=some, 2=few, 3=most, 4=all) (default = 1, debugLevel 4 is only recommended for solving difficult issues)
- icon_refresh = User defined icon number for refresh status
- icon_green = User defined icon number for values less than 0.3 μSv/h
- icon_yellow = User defined icon number for values between 0.3 and 0.8 μSv/h 
- icon_red = User defined icon number for values greater than 0.8 μSv/h
- icon_error = User defined icon number in case of an error gettng the data


Version 1.1 (9th January 2023)
- Changed handling of negative values for dots and icons: if tonumber(num) >= 0 and tonumber(num) <= 0.3 then 
- Added a better translation for French (thanks to @fredoki)


Version 1.0 (5th November 2022)
- Added the nearest five reactors to the labels with distance and bearing
- Added a button to refresh the list of (five nearest) reactors
- Added a warning at startup if the latitude or longitude differs from the setup of your HC3
- Replaced the creation of the dots 🟢🟡🔴 to the labels, so no longer for all sensors
- Added some extra notifications to the labels in case the website is down
- Extended the http timeout a bit, to give the reverse geocoding some more time to respond
- Added translations for new functions

Version 0.5 (29th October 2022)
- Added translation to the Reverse API geocoding response (city and country)
- Changed calculation of the bearings only for the 7 selected sensors, not all sensors
- Optimized the code and added more structure by using multi file code (main, childs and i18n)

Version 0.4 (22nd October 2022)
- Added six Child devices for the nearest sensor 24h average, 2nd, 3rd, 4th, 5th nearest sensor sample, the nearest sensor maximum sample and the nearest sensor maximum 24h average
- Added icons based on sensor measurements to all Child Devices
- Added translations for the labels and properties from English to French, Polish and Dutch. (Thanks to @ppeterr and @fredokl for help with the translation)
- Limited the details of the response of the Reverse Geocoding with zoom=10 (address detail = city)

Version 0.3 (16th October 2022)
- Added the City and Country also for worst sample and worst average sensors
- Added all debug information and set the debug levels
- Optimised the code

Version 0.2 (15th October 2022)
- Added the City and Country for all 5 sensors, not only the first one

Version 0.1 (15th October 2022)
- Initial version
