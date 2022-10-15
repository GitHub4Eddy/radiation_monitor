# radiation_monitor
The Radiation Monitor collects radiation levels from all available stations around the world and shows 5 nearest stations to your location and one station with highest current readings and one station with the highest 24 hour average readings. The QuickApp uses the location (latitude and ongitude) of your Homecenter to measure the distance to the stations and to get the nearest stations. The bearings in degrees from your location to the stations is shown. 
 
image.png.6a44c190a3b20ae702f394ef05078094.png
 
Radioactive@Home is a Polish science project using the distributed computing capabilities of the BOINC platform. The main goal of the project is to create a free and continuously updated map of radiation levels available for everyone, by gathering information about gamma radiation using sensors connected to the computers of volunteers willing to participate in the project. Project is completely non-commercial, participating will be free of charge (excluding cost of detector) and the software will be licensed under the GNU General Public License (GPL).
 
In land navigation, a 'bearing' is ordinarily calculated in a clockwise direction starting from a reference direction of 0° and increasing to 359.9 degrees. Measured in this way, a bearing is referred to as an azimuth by the US Army but not by armies in other English speaking nations, which use the term bearing.

μSv/h: The sievert (symbol: Sv) is a unit in the International System of Units (SI) intended to represent the stochastic health risk of ionizing radiation.
 
The human population is continuously exposed to ionizing radiation from several natural sources (cosmic and terrestrial contributions). For most individuals, exposure to natural sources exceeds that from all man-made (artificial) sources combined. The man-made sources arise from peaceful (e.g. medical use, energy generation, and associated fuel cycle facilities, radioisotope production, waste management) and military purposes (nuclear tests and their fallout or radioactive release, nuclear explosions).
 
Radiation levels: 
Green:  Radiation up to 0.3 μSv/h
Yellow: Radiation between 0.3 and 0.8 μSv/h 
Red:    Radiation above 0.8 μSv
 
1.14 µSv.h - Shelter population
5.7 µSv.h - Evacuation of population
11.4 µSv.h - Issue Iodine tablets
0.114 µSv.h - Max daily dose == 1 mSv.year
 
image.thumb.png.74f8f948241c45957bf146ae22db11fe.png
 
 
Radioactive@Home Map: http://radioactiveathome.org/map/
Reverse geocoding: https://nominatim.org/release-docs/latest/api/Reverse/ licence:Data © OpenStreetMap contributors, ODbL 1.0.https://osm.org/copyright 
Status servers: http://radioactiveathome.org/boinc/server_status.php

Variables (mandatory and created automatically): 
latitude =     Latitude of your location (Default is the latitude of your HC3)
longitude =    Longitude of your location (Default is the longitude of your HC3)
interval =     Interval in seconds to get the data from the Radioactive@Home website
debugLevel =   Number (1=some, 2=few, 3=all) (default = 1)
icon_refresh = User defined icon number for refresh status
icon_green =   User defined icon number for values less than 0.3 μSv/h
icon_yellow =  User defined icon number for values between 0.3 and 0.8 μSv/h 
icon_red =     User defined icon number for values greater than 0.8 μSv/h
icon_error =   User defined icon number in case of an error gettng the data
