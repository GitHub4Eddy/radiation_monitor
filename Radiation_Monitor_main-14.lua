--[[ QUICKAPP RADIATION MONITOR


The Radiation Monitor collects radiation levels from all available stations around the world and shows 5 nearest stations to your location and one station with highest current readings and one station with the highest 24 hour average readings. The QuickApp uses the location (latitude and ongitude) of your Homecenter to measure the distance to the stations and to get the nearest stations. The bearings in degrees from your location to the stations is shown. Next to the measurements, the five nearest reactors are shown. The languages English, French, Polish and Duth are supported. 

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
Green: Radiation up to 0.3 μSv/h
Yellow: Radiation between 0.3 and 0.8 μSv/h 
Red: Radiation above 0.8 μSv/h

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
- setupChildDevices() Setup all child devices
- loadMap() Get the webpage from http://radioactiveathome.org/map/ (loadMap() is the main loop of the QuickApp)
- extractData() Extract the data from the webpage source-code (extract the reactor data once and the sensor data always)
- geoDistance() Calculate the distance from the HC3 (QuickApp variables) lat/lon to the sensors lat/lon
- Store the values of all sensors in a table and sort the table on distance
- Run through the table to get the maximum measurement and maximum average measurements. If there are more than one, get the one that is the nearest-by
- updateIcon() Set the icon (color) based on the sensor measurement
- getCity() Get the cities, countries and calculate the geoBearing() for the seven selected sensors and five reactors from https://nominatim.openstreetmap.org/ and store them in a table
- updateLabels() Update the labels (and assign the color dots to the sensor readings)
- updateChildDevices() Update the Child Devices
- updateProperties() Update the properties
- Return to the main loop loadMap()


Links:
- Radioactive@Home Map: http://radioactiveathome.org/map/
- Status servers: http://radioactiveathome.org/boinc/server_status.php
- Reverse geocoding: https://nominatim.org/release-docs/latest/api/Reverse/ licence:Data © OpenStreetMap contributors, ODbL 1.0. https://osm.org/copyright
- Nominatim Usage Policy (aka Geocoding Policy): https://operations.osmfoundation.org/policies/nominatim/

sensorData response line:
L.marker([50.58, 8.69], {icon: icon_green}).bindPopup('Last sample: 0.08 uSv/h<br />Last contact: 2022-10-02 05:56:39<br/>24 hours average: 0.07 uSv/h<br />Sensor 43342<br/><a href=http://radioactiveathome.org/scripts/graph/drawweekdotted.php?hostid=43342>7 days plot</a><br/>Team: hidden<br />Nick: hidden').addTo(map);
or
L.marker([52.16, 4.5], {icon: icon_green}).bindPopup('Last sample: 0.11 uSv/h<br />Last contact: 2022-10-02 07:29:02<br/>24 hours average: 0.09 uSv/h<br /><a href=http://radioactiveathome.org/boinc/show_host_detail.php?hostid=43604>Details sensor 43604</a><br/><a href=http://radioactiveathome.org/boinc/results.php?hostid=43604>Work Units</a><br/><a href=http://radioactiveathome.org/scripts/graph/drawweekdotted.php?hostid=43604>7 days plot</a><br/>Team: AMD Users<br />Nick: Dirk Broer').addTo(map);

reactorData response line:
L.marker([22.5989, 114.544], {icon: icon_gold}).bindPopup('Name: Daya Bay 1 (Guangdong-1)<br>Capacity (Netto): 944 MW<br>Status: Operating<br>Start Year:1994<br>Owner: Guangdong Nuclear Power JVC (GNP JVC)').addTo(map);

Geocity json response:
{"place_id":298246927,"licence":"Data © OpenStreetMap contributors, ODbL 1.0. https://osm.org/copyright","osm_type":"relation","osm_id":88686,"lat":"51.3155092","lon":"6.2714171","place_rank":16,"category":"boundary","type":"administrative","importance":0.43630711984004145,"addresstype":"city","name":"Nettetal","display_name":"Nettetal, Kreis Viersen, North Rhine-Westphalia, 41334, Germany","address":{"town":"Nettetal","county":"Kreis Viersen","state":"North Rhine-Westphalia","ISO3166-2-lvl4":"DE-NW","postcode":"41334","country":"Germany","country_code":"de"},"boundingbox":["51.2527722","51.3659405","6.1538213","6.3265566"]}

geoIDs Table json syntax:
[{"lon":"4.42","lat":"50.81"},{"lon":"5.48","lat":"50.96"},{"lon":"6.2","lat":"51.32"},{"lon":"6.56","lat":"51.34"},{"lon":"6.53","lat":"50.83"},{"lon":"127.03","lat":"37.53"},{"lon":"8.44","lat":"45.96"},{"lon":"3.71867","lat":"51.4311"},{"lon":"4.25658","lat":"51.3249"},{"lon":"4.25919","lat":"51.3227"},{"lon":"4.25708","lat":"51.3249"},{"lon":"4.25868","lat":"51.3227"}]

Geodata Table json syntax:
[{"bearing":177,"city":"Watermael-Boitsfort - Watermaal-Bosvoorde","country":"Belgium","number":1},{"bearing":146,"city":"Genk","country":"Belgium","number":2},{"bearing":122,"city":"Nettetal","country":"Germany","number":3},{"bearing":117,"city":"Krefeld","country":"Germany","number":4},{"bearing":131,"city":"Merzenich","country":"Germany","number":5},{"bearing":43,"city":"Seoul","country":"South Korea","number":6},{"bearing":155,"city":"Mergozzo","country":"Italy","number":7},{"bearing":209,"city":"","country":"","number":8},{"bearing":182,"city":"","country":"","number":9},{"bearing":182,"city":"","country":"","number":10},{"bearing":182,"city":"","country":"","number":11},{"bearing":182,"city":"","country":"","number":12}]

Reverse API and parameters
https://nominatim.openstreetmap.org/reverse?lat=<value>&lon=<value>&format=jsonv2&zoom=10&accept-language=<language>

Variables (mandatory and created automatically): 
- latitude = Latitude of your location (Default is the latitude of your HC3)
- longitude = Longitude of your location (Default is the longitude of your HC3)
- language = Preferred language (default = en) (supported languages are French (fr), Polish (pl), Croatian (hr) and Dutch (nl))
- interval = Interval in seconds to get the data from the Radioactive@Home website
- debugLevel = Number (1=some, 2=few, 3=most, 4=all) (default = 1, debugLevel 4 is only recommended for solving difficult issues)
- icon_refresh = User defined icon number for refresh status
- icon_green = User defined icon number for values less than 0.3 μSv/h
- icon_yellow = User defined icon number for values between 0.3 and 0.8 μSv/h 
- icon_red = User defined icon number for values greater than 0.8 μSv/h
- icon_error = User defined icon number in case of an error gettng the data


TODO:
- Maybe: Show the city and country for the reactors ?


Version 1.4 (6th February 2024)
- Added extra check for an empty response in the address from Geocity (thanks to @Sankotronic from the Fibaro forum)


Version 1.3 (17th July 2023)
- Added extra check for the right response from Geocity (in case of response {"error":"Unable to geocode"})

Version 1.2 (11th January 2023)
- Added support for Croatian language thanks to @Sankotronic

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
- Added six Child devices for the nearest sensor 24h average, 2nd, 3rd, 4th, 5th nearest sensor measurement, the nearest sensor maximum measurement and the nearest sensor maximum 24h average
- Added icons based on sensor measurements to all Child Devices
- Added translations for the labels and properties from English to French, Polish and Dutch
- Limited the details of the response of the Reverse Geocoding with zoom=10 (address detail = city)

Version 0.3 (16th October 2022)
- Added the City and Country also for maximum measurement and maximum average measurement
- Added all debug information and set the debug levels
- Optimised the code

Version 0.2 (15th October 2022)
- Added the City and Country for all 5 sensors, not only the first one

Version 0.1 (15th October 2022)
- Initial version


No editing of this code is needed --]]

local version = '1.4'

function QuickApp:buttonEvent() -- Refresh button event
  if reactor_find then
    reactor_find = false
    self:updateView("button", "text", translation["Refresh reactor list next interval"])
  else
    reactor_find = true
    self:updateView("button", "text", translation["Reactor list will be refreshed next interval"])
  end
end


function QuickApp:logging(level,text) -- Logging function for debug
  if tonumber(self:getVariable("debugLevel")) >= tonumber(level) then 
    self:debug(text)
  end
end


local function updateIcon(num) -- Set the icon (colour) based on the sensor measurement
  if tonumber(num) <= 0.3 then 
    return tonumber(quickApp:getVariable("icon_green")) 
  elseif tonumber(num) <= 0.8 and tonumber(num) > 0.3 then
    return tonumber(quickApp:getVariable("icon_yellow")) 
  elseif tonumber(num) > 0.8 then
    return tonumber(quickApp:getVariable("icon_red")) 
  else
    return tonumber(quickApp:getVariable("icon_error")) 
  end
end


local function updateProperties() -- Update the properties and return to the main loop loadMap()
  quickApp:logging(2,"updateProperties() - Update the properties and return to the main loop loadMap()")
  quickApp:updateProperty("value", tonumber(sensorData[1].sample)) 
  quickApp:updateProperty("unit", "μSv/h")
  quickApp:updateProperty("log", sensorData[1].contact)
  quickApp:updateProperty("deviceIcon", updateIcon(sensorData[1].sample)) -- Set the icon (color) based on the sensor measurement
  quickApp:logging(3, "data: " ..json.encode(data))
  quickApp:logging(2,"loadMap() - Return to loadMap() and wait for the interval of " ..quickApp:getVariable("interval")  .." seconds")
end


local function updateChildDevices() -- Update Child Devices
  quickApp:logging(2,"updateChildDevices() - Update Child Devices")
  for id,child in pairs(quickApp.childDevices) do -- Update Child Devices
    child:updateValue(data) 
  end
end


local function setColor(num) -- Set the color 🟢🟡🔴 based on the sensor measurement
  if tonumber(num) >= 0 and tonumber(num) <= 0.3 then 
    return "🟢"
  elseif tonumber(num) <= 0.8 and tonumber(num) > 0.3 then
    return "🟡"
  else
    return "🔴"
  end
end


local function updateLabels() -- Update the labels
  quickApp:logging(2,"updateLabels() - Update the labels")
  table.sort(geoData,function(a,b) return tonumber(a.number) < tonumber(b.number) end)
  quickApp:logging(3,"geoData: " ..json.encode(geoData))
  local labelText = ""
  for i=1,5 do 
    labelText = labelText ..translation["Sensor"] ..": " ..sensorData[i].sensor .." (" ..(geoData[i].city or "") .." " ..(geoData[i].country or "") ..")" .."\n"
    labelText = labelText .."Lat: " ..sensorData[i].lat .." Lon: " ..sensorData[i].lon .." (" ..sensorData[i].distance .." km " ..geoData[i].bearing .."°)" .."\n"
    labelText = labelText ..setColor(sensorData[i].sample) .." " ..translation["Radiation"] ..": " ..sensorData[i].sample .." μSv/h" .."\n"
    labelText = labelText ..setColor(sensorData[i].average) .." " ..translation["24hour average"] ..": " ..sensorData[i].average .." μSv/h" .."\n"
    labelText = labelText ..translation["Date"] ..": " ..sensorData[i].contact .."\n\n"
  end
  
  if data.sampleMaxID == data.averageMaxID then -- In case sensors maximum measurement and maximum average measurement are the same
    labelText = labelText ..translation["Nearest maximum measurement and maximum average location"] ..": " 
  else
    labelText = labelText ..translation["Nearest maximum measurement location"] ..": " 
  end

    labelText = labelText..sensorData[data.sampleMaxID].sensor .."\n"
    labelText = labelText ..(geoData[6].city or "") .." " ..(geoData[6].country or "") .."\n"
    labelText = labelText .."Lat: " ..sensorData[data.sampleMaxID].lat .." Lon: " ..sensorData[data.sampleMaxID].lon .." (" ..sensorData[data.sampleMaxID].distance .." km " ..geoData[6].bearing .."°)" .."\n"
    labelText = labelText ..setColor(sensorData[data.sampleMaxID].sample) .." " ..translation["Radiation"] ..": " ..sensorData[data.sampleMaxID].sample .." μSv/h" .."\n"
    labelText = labelText ..setColor(sensorData[data.sampleMaxID].average) .." " ..translation["24hour average"] ..": " ..sensorData[data.sampleMaxID].average .." μSv/h" .."\n"
    labelText = labelText ..translation["Date"] ..": " ..sensorData[data.sampleMaxID].contact .."\n\n"

  if data.sampleMaxID ~= data.averageMaxID then -- In case sensors maximum measurement and maximum average aren't the same
    labelText = labelText ..translation["Nearest maximum average location"] ..": " ..sensorData[data.averageMaxID].sensor .."\n"
    labelText = labelText ..(geoData[7].city or "") .." " ..(geoData[7].country or "") .."\n"
    labelText = labelText .."Lat: " ..sensorData[data.averageMaxID].lat .." Lon: " ..sensorData[data.averageMaxID].lon .." (" ..sensorData[data.averageMaxID].distance .." km " ..geoData[7].bearing .."°)" .."\n"
    labelText = labelText ..setColor(sensorData[data.averageMaxID].sample) .." " ..translation["Radiation"] ..": " ..sensorData[data.averageMaxID].sample .." μSv/h" .."\n"
    labelText = labelText ..setColor(sensorData[data.averageMaxID].average) .." " ..translation["24hour average"] ..": " ..sensorData[data.averageMaxID].average .." μSv/h" .."\n"
    labelText = labelText ..translation["Date"] ..": " ..sensorData[data.averageMaxID].contact .."\n\n"
  end

  labelText = labelText ..translation["Total sensors"] ..": " ..data.sensorTotal .."\n\n"
  
  for i=1,5 do 
    labelText = labelText .."☢️ " ..reactorData[i].owner .."\n"
    labelText = labelText ..reactorData[i].reactor .." Lat: " ..reactorData[i].lat .." Lon: " ..reactorData[i].lon .." (" ..reactorData[i].distance .." km "  ..geoData[i+7].bearing .."°)".."\n"
    labelText = labelText ..translation["Capacity"] ..": " ..reactorData[i].capacity .." " ..translation["Status"] ..": " ..reactorData[i].status .." Start: " ..reactorData[i].startyear .."\n\n"
  end

  quickApp:updateView("label", "text", labelText)
  quickApp:updateView("button", "text", translation["Refresh reactor list next interval"]) -- Update the button label to the default value
  quickApp:logging(2,"Label: " ..labelText)
end


local function geoBearing(lat1, lon1, lat2, lon2) -- Calculate the bearing from the HC3 (QuickApp variables) lat/lon to the sensors lat/lon
  if lat1 == nil or lon1 == nil or lat2 == nil or lon2 == nil then
    return 0
  end
  local deltaLon = lon1 - lon2
  local x = math.cos(math.rad(lat1)) * math.sin(math.rad(deltaLon))
  local y = math.cos(math.rad(lat2)) * math.sin(math.rad(lat1)) - math.sin(math.rad(lat2)) * math.cos(math.rad(lat1)) * math.cos(math.rad(deltaLon))
  local bearing = (math.deg(math.atan2(x,y)) + 360.0) % 360.0
  return tonumber(string.format("%.0f", bearing)) 
end


local function getCity() -- Get the cities and countries and calculate the bearings for the seven selected sensors from https://nominatim.openstreetmap.org/ and store them in a table
  quickApp:logging(2,"getCity() - Get the cities and countries and calculate the bearings for the seven selected sensors from https://nominatim.openstreetmap.org/ and store them in a table")
  local address = ""
  local geoIDs = {}
  geoData = {} -- Clear geoData every loop 
  for i=1,5 do --  Insert the first 5 sensors
    table.insert(geoIDs,i,{lat=sensorData[i].lat,lon=sensorData[i].lon}) -- Insert the 5 nearest sensors
  end
  table.insert(geoIDs,6,{lat=sensorData[data.sampleMaxID].lat,lon=sensorData[data.sampleMaxID].lon}) -- Insert the (nearest) sensor with the maximum measurement
  table.insert(geoIDs,7,{lat=sensorData[data.averageMaxID].lat,lon=sensorData[data.averageMaxID].lon}) -- Insert the (nearest) sensor with the maximum average
  for i=1,5 do -- Insert the first 5 reactors
    table.insert(geoIDs,i+7,{lat=reactorData[i].lat,lon=reactorData[i].lon}) -- Insert the 5 nearest reactors
  end  
  quickApp:logging(3,"geoIDs: " ..json.encode(geoIDs))

  --for i=1,12 do
  for i=1,7 do 
    quickApp:logging(3, "Get City and Country " ..i .." with: " ..geoIDs[i].lat .." " ..geoIDs[i].lon)
    address = "https://nominatim.openstreetmap.org/reverse?lat=" ..geoIDs[i].lat .."&lon=" ..geoIDs[i].lon .."&format=jsonv2&zoom=10&accept-language=" ..string.lower(quickApp:getVariable("language"))
    quickApp:logging(3, "Address " ..address)
    http:request(address,{options = {headers = headers, checkCertificate = true,  method = "GET",},
      success = function(response)
        if (response.status < 200 or response.status >= 300 or response.data == '{"error":"Unable to geocode"}') or response.data == nil then
          if response.status >= 200 or response.status < 300 then -- Response must be error or empty
            quickApp:warning("Wrong response (error or empty) from getCity!")
          else
            quickApp:warning("Wrong status '" .. response.status .. "' in getCity response!")
          end 
          table.insert(geoData,{number=i,city="", country="", bearing=0}) -- Insert empty city and country if nothing is found or bad response
        else
          quickApp:logging(3,"response.data geoCity: " ..response.data)
          local jsonTable = {}
          jsonTable = json.decode(response.data)
          table.insert(geoData,{number=i, city=(jsonTable.address.city or jsonTable.address.village or jsonTable.address.town), country=jsonTable.address.country, bearing=geoBearing(geoIDs[i].lat, geoIDs[i].lon, tonumber(quickApp:getVariable("latitude")), tonumber(quickApp:getVariable("longitude")))})
        end
      end,
      error = function(error)
      table.insert(geoData,{number=i,city="", country="", bearing=0}) -- Insert empty city and country if nothing is found or bad response
      quickApp:error("Connection error: " ..json.encode(error))
    end})
  end
  for i=8,12 do -- Insert only the bearing for the 5 reactors
    table.insert(geoData,{number=i, city="", country="", bearing=geoBearing(geoIDs[i].lat, geoIDs[i].lon, tonumber(quickApp:getVariable("latitude")), tonumber(quickApp:getVariable("longitude")))})
  end
  fibaro.setTimeout(10*1000, function() updateLabels() end) -- Update the labels
  fibaro.setTimeout(10*1000, function() updateChildDevices() end) -- Update the Child Devices
  fibaro.setTimeout(10*1000, function() updateProperties() end) -- Update the properties
end


local function geoDistance(lat1, lon1, lat2, lon2) -- Calculate the distance from the HC3 (QuickApp variables) lat/lon to the sensors lat/lon
  if lat1 == nil or lon1 == nil or lat2 == nil or lon2 == nil then
    return 0
  end
  local R = 6372.797560856 -- Earth's in meters
  local sin_dlat = math.sin((math.rad(lat2 - lat1)) / 2)
  local sin_dlon = math.sin((math.rad(lon2 - lon1)) / 2)
  local a = sin_dlat * sin_dlat + math.cos(math.rad(lat1)) * math.cos(math.rad(lat2)) * sin_dlon * sin_dlon
  local distance = R * (2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))) -- To get miles, use 3963 as the constant (equator again)
  return tonumber(string.format("%.0f", distance))
end


local function extractData(pageSource) -- Extract the data from the webpage source-code
  quickApp:logging(2,"extractData() - Extract the data from the webpage source-code")
  quickApp:logging(4,"pageSource: " ..pageSource)
  
  sensorData = {} -- Get the sensor data from the page source
  data.sensorTotal = 0
  local start_find = string.find(pageSource, "// show a marker on the map") + 114 -- Look for the markers on the map
  local end_find = string.find(pageSource, "icon: icon_gold") - 30
  local extract = pageSource:sub(start_find, end_find) -- Extract the sensor readings from the page source
  quickApp:logging(4,"extract sensors: " ..extract)

  if start_find ~= nil then 
    local sensor, lat, lon, sample, average, contact, city, country, distance = "", "", "", "", "", "", "", "", ""
    local timezone = os.difftime(os.time(), os.time(os.date("!*t",os.time())))/3600 -- Check timezone and daylight saving time
    if os.date("*t").isdst then -- Check daylight saving time 
      timezone = timezone + 1
    end
    local pattern = "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)" -- Convert time of measurement to local timezone
    local runyear, runmonth, runday, runhour, runminute, runseconds = "", "", "", "", "", ""
    local convertedTimestamp = ""

    local extract_line = ""
    extract = extract:gsub("<br/>", " ") -- Get rid of html tags
    extract = extract:gsub("<br />", " ")
    extract = extract:gsub("</a>", " ")
    extract = extract:gsub("<a href=", " ")

    while extract:len() > 100 do
      end_find = string.find(extract, ";") - 1
      extract_line = extract:sub(1, end_find) -- Get one line for one sensor
      quickApp:logging(4,"extract_line sensor: " ..extract_line)

      start_find = string.find(extract_line, "ensor") + 6 -- Sensor 40389 http or Details sensor 34532 http (without "S" because upper and lower case) 
      sensor = extract_line:sub(start_find, start_find + 5) -- Maximum length sensor ID is 5
      sensor = sensor:gsub("%a", "") -- Delete non digital characters, if there are any
      sensor = sensor:gsub(" ", "") -- Delete spaces, if there are any

      start_find = string.find(extract_line, "L.marker") + 10 -- L.marker([50.83, 8.94
      end_find = string.find(extract_line, ",") - 1
      lat = extract_line:sub(start_find, end_find)

      start_find = string.find(extract_line, ",") + 2 -- 50.83, 8.94], {
      end_find = string.find(extract_line, "]") - 1
      lon = extract_line:sub(start_find, end_find)

      start_find = string.find(extract_line, "sample:") + 8 -- Last sample: 0.15 uSv/h
      end_find = string.find(extract_line, "uSv") - 2
      sample = extract_line:sub(start_find, end_find)

      start_find = string.find(extract_line, "average:") + 9 -- 24 hours average: 0.14 uSv/h
      average = extract_line:sub(start_find, start_find + 3)
      average = average:gsub("%a", "") -- Delete non digital characters, if there are any

      start_find = string.find(extract_line, "contact:") + 9 -- Last contact: 2022-10-02 07:17:16 24 hours average
      end_find = string.find(extract_line, "hours") - 4
      contact = extract_line:sub(start_find, end_find)
      
      runyear, runmonth, runday, runhour, runminute, runseconds = contact:match(pattern)
      convertedTimestamp = os.time({year = runyear, month = runmonth, day = runday, hour = runhour, min = runminute, sec = runseconds})
      contact = os.date("%d-%m-%Y %X", convertedTimestamp +(timezone*3600))

      distance = geoDistance(lat, lon, tonumber(quickApp:getVariable("latitude")), tonumber(quickApp:getVariable("longitude"))) -- Calculate the distance from the HC3 (QuickApp variables) lat/lon to the sensors lat/lon

      table.insert(sensorData,{sensor=sensor,lat=lat,lon=lon,sample=sample,average=average,contact=contact,distance=distance}) -- Store the values of all sensors in a table and sort the table on distance

      end_find = string.find(extract, ";") + 2
      if end_find == nil then
        return
      else 
        data.sensorTotal = data.sensorTotal + 1
        extract = extract:sub(end_find) -- Erase the sensor reading line
      end
    end

    table.sort(sensorData,function(a,b) return tonumber(a.distance) < tonumber(b.distance) end) --  Sort the sensor table on distance
    quickApp:logging(3,"sensorData: " ..json.encode(sensorData))

    -- Run through the sensor table to get the maximum measurement and maximum average measurements. If there are more than one, get the one that is the nearest-by
    data.sampleMaxID, data.averageMaxID = 0, 0
    local sampleMax, averageMax = 0, 0 
    for n in pairs(sensorData or {}) do 
      if tonumber(sensorData[n].sample) > tonumber(sampleMax) then
        sampleMax = sensorData[n].sample
        data.sampleMaxID = n
      end
      if tonumber(sensorData[n].average) > tonumber(averageMax) then
        averageMax = sensorData[n].average
        data.averageMaxID = n
      end   
    end

    -- Set the icon (color) based on the sensor measurement
    data.icon1 = updateIcon(sensorData[1].average)
    data.icon2 = updateIcon(sensorData[2].sample)
    data.icon3 = updateIcon(sensorData[3].sample)
    data.icon4 = updateIcon(sensorData[4].sample)
    data.icon5 = updateIcon(sensorData[5].sample)
    data.icon6 = updateIcon(sensorData[data.sampleMaxID].sample)
    data.icon7 = updateIcon(sensorData[data.averageMaxID].average)

    if reactor_find then -- Get the reactor data only once
      reactorData = {} -- Get the reactor data from the page source
      start_find = string.find(pageSource, "icon: icon_gold") - 50 -- Look for the first icon_gold in the page source
      end_find = string.find(pageSource, "var marker") - 12
      extract = pageSource:sub(start_find, end_find) -- Extract the reactor data from the page source
      start_find = string.find(extract, ";") + 1
      extract = extract:sub(start_find) -- Clear the first part
      quickApp:logging(4,"extract reactors: " ..extract)

      local reactor, capacity, status, startyear, owner = "", "", "", "", ""
      lat, lon, city, country, distance = "", "", "", "", ""
      extract_line = "" -- Clear extract_line
      extract = extract:gsub("<br>", " ")

      while extract:len() > 200 do
        end_find = string.find(extract, ";") - 1
        extract_line = extract:sub(1, end_find) -- Get one line for one reactor
        quickApp:logging(4,"extract_line reactor: " ..extract_line)

        start_find = string.find(extract_line, "Name: ") + 6 -- Name: St. Laurent-B1 Capacity
        end_find = string.find(extract_line, "Capacity") - 1
        reactor = extract_line:sub(start_find, end_find)

        start_find = string.find(extract_line, "L.marker") + 10 -- L.marker([44.3297, 4.73318
        end_find = string.find(extract_line, ",") - 1
        lat = extract_line:sub(start_find, end_find)

        start_find = string.find(extract_line, ",") + 2 -- 44.3297, 4.73318], {
        end_find = string.find(extract_line, "]") - 1
        lon = extract_line:sub(start_find, end_find)

        start_find = string.find(extract_line, "): ") + 3 -- Capacity (Netto): 915 MW Status
        end_find = string.find(extract_line, "Status") - 1 
        capacity = extract_line:sub(start_find, end_find)

        start_find = string.find(extract_line, "Status: ") + 8 -- Status: Operating Start Year
        end_find = string.find(extract_line, "Start Year") - 1
        status = extract_line:sub(start_find, end_find)

        start_find = string.find(extract_line, "Start Year: ") + 12 -- Start Year: 1981 Owner
        end_find = string.find(extract_line, "Owner") - 1
        startyear = extract_line:sub(start_find, end_find)

        start_find = string.find(extract_line, "Owner: ") + 7 -- Owner: Electricite de France (EdF)').addTo(map)
        end_find = string.find(extract_line, "addTo") - 4
        owner = extract_line:sub(start_find, end_find)

        distance = geoDistance(lat, lon, tonumber(quickApp:getVariable("latitude")), tonumber(quickApp:getVariable("longitude"))) -- Calculate the distance from the HC3 (QuickApp variables) lat/lon to the reactors lat/lon

        -- Store the values of all reactors in a table and sort the table on distance
        table.insert(reactorData,{reactor=reactor,lat=lat,lon=lon,capacity=capacity,status=status,startyear=startyear,owner=owner,distance=distance}) 

        end_find = string.find(extract, ";") + 2
        if end_find == nil then
          return
        else 
          extract = extract:sub(end_find) -- Erase the reactor reading line
        end
      end
      table.sort(reactorData,function(a,b) return tonumber(a.distance) < tonumber(b.distance) end) --  Sort the reactor table on distance
      quickApp:logging(3,"reactorData: " ..json.encode(reactorData))
      reactor_find = false
    end

  else
    quickApp:warning("No measurements found")
      quickApp:updateProperty("deviceIcon", tonumber(quickApp:getVariable("icon_error"))) -- Set the icon (color) to error
    return
  end
end


function QuickApp:loadMap() -- Get the webpage from http://radioactiveathome.org/map/ (This is the main loop of the QuickApp)
  self:logging(2,"loadMap() - Get the webpage from http://radioactiveathome.org/map/ (This is the main loop of the QuickApp)")
  local address = "http://radioactiveathome.org/map/"
  http:request(address,{options = {headers = headers, method = "GET",}, success = function(response)
   if (response.status < 200 or response.status >= 300) then
      self:warning("Wrong status '" .. response.status .. "' in loadMap response!")
    else
      local pageSource = response.data
      self:updateProperty("deviceIcon", tonumber(self:getVariable("icon_refresh"))) -- Set the icon (color) to refresh
      extractData(pageSource) --Extract the data from the webpage source-code
      getCity() -- Get the cities and countries for the seven selected sensors from https://nominatim.openstreetmap.org/ and store them in a table
    end
  end,
  error = function(error)
    self:error("Connection error: " ..json.encode(error))
    self:updateView("label", "text", "Connection error: " ..json.encode(error))
    self:updateProperty("log", "error: " ..json.encode(error))
    self:updateProperty("deviceIcon", tonumber(self:getVariable("icon_error"))) -- Set the icon (color) to error
  end
  })
  fibaro.setTimeout(tonumber(self:getVariable("interval"))*1000, function() self:loadMap() end)
end


local function getChildVariable(child,varName)
  for _,v in ipairs(child.properties.quickAppVariables or {}) do
    if v.name==varName then return v.value end
  end
  return ""
end


function QuickApp:setupChildDevices() -- Setup all child devices
  self:logging(2,"setupChildDevices() - Setup all child devices")
  local cdevs = api.get("/devices?parentId="..self.id) or {} -- Pick up all Child Devices
  function self:initChildDevices() end -- Null function, else Fibaro calls it after onInit()...

  if #cdevs == 0 then -- If no Child Devices, create them
    local initChildData = { 
      {className="sensor1", name="24h average", type="com.fibaro.multilevelSensor", value=0},
      {className="sensor2", name="Sensor 2", type="com.fibaro.multilevelSensor", value=0},
      {className="sensor3", name="Sensor 3", type="com.fibaro.multilevelSensor", value=0},
      {className="sensor4", name="Sensor 4", type="com.fibaro.multilevelSensor", value=0},
      {className="sensor5", name="Sensor 5", type="com.fibaro.multilevelSensor", value=0},
      {className="sensor6", name="Max sample", type="com.fibaro.multilevelSensor", value=0},
      {className="sensor7", name="Max 24 average", type="com.fibaro.multilevelSensor", value=0},
    }
    for _,c in ipairs(initChildData) do
      local child = self:createChildDevice(
        {name = c.name, type=c.type, value=c.value, initialInterfaces = {}, }, 
        _G[c.className] -- Fetch class constructor from class name
      )
      child:setVariable("className",c.className)  -- Save class name so we know when we load it next time
    end   
  else 
    for _,child in ipairs(cdevs) do
      local className = getChildVariable(child,"className") -- Fetch child class name
      local childObject = _G[className](child) -- Create child object from the constructor name
      self.childDevices[child.id]=childObject
      childObject.parent = self -- Setup parent link to device controller 
    end
  end
end


function QuickApp:createVariables() -- Setup the global variables
  self:logging(2,"createVariables() - Setup the global variables")
  sensorData, geoData, data = {}, {}, {}
  data.sensorTotal, data.sampleMaxID, data.averageMaxID = 0, 0, 0
  data.icon1, data.icon2, data.icon3, data.icon4, data.icon5, data.icon6, data.icon7 = tonumber(self:getVariable("icon_refresh")), tonumber(self:getVariable("icon_refresh")), tonumber(self:getVariable("icon_refresh")), tonumber(self:getVariable("icon_refresh")), tonumber(self:getVariable("icon_refresh")), tonumber(self:getVariable("icon_refresh")), tonumber(self:getVariable("icon_refresh"))
  translation = i18n:translation(string.lower(self:getVariable("language"))) -- Initialise the translation
  reactor_find = true
  self:updateProperty("deviceIcon", tonumber(self:getVariable("icon_refresh"))) -- Set the icon (color) to refresh
end


function QuickApp:getQuickAppVariables() -- Get all Quickapp Variables or create them
  local latitude = tonumber(self:getVariable("latitude"))
  local longitude = tonumber(self:getVariable("longitude"))
  local language = string.lower(self:getVariable("language"))
  local interval = self:getVariable("interval") 
  local debugLevel = self:getVariable("debugLevel") 
  local icon_refresh = self:getVariable("icon_refresh") 
  local icon_green = self:getVariable("icon_green") 
  local icon_yellow = self:getVariable("icon_yellow") 
  local icon_red = self:getVariable("icon_red") 
  local icon_error = self:getVariable("icon_error") 
  
  if latitude == 0 or latitude == nil then 
    latitude = tostring(api.get("/settings/location")["latitude"]) or 40.866667 -- Or centre of the earth
    self:setVariable("latitude", latitude)
    self:trace("Added QuickApp variable latitude with HC3 value " ..latitude)
  elseif latitude ~= api.get("/settings/location")["latitude"] then
    self:warning("The latitude in the QuickApp variable (" ..latitude ..") differs from the latitude setting of your HC3 (" ..api.get("/settings/location")["latitude"]..")")
  end  
  if longitude == 0 or longitude == nil then
    longitude = tostring(api.get("/settings/location")["longitude"]) or 34.566667 -- Or centre of the earth
    self:setVariable("longitude", longitude)
    self:trace("Added QuickApp variable longitude with HC3 value " ..longitude)
  elseif longitude ~= api.get("/settings/location")["longitude"] then
    self:warning("The longitude in the QuickApp variable (" ..longitude ..") differs from the longitude setting of your HC3 (" ..api.get("/settings/location")["longitude"]..")")
  end
  if language == "" or language == nil or type(i18n:translation(string.lower(self:getVariable("language")))) ~= "table" then
    language = "en" 
    self:setVariable("language",language)
    self:trace("Added QuickApp variable language")
  end
  if interval == "" or interval == nil then
    interval = "3601" 
    self:setVariable("interval",interval)
    self:trace("Added QuickApp variable interval")
  end
  if debugLevel == "" or debugLevel == nil then
    debugLevel = "1" 
    self:setVariable("debugLevel",debugLevel)
    self:trace("Added QuickApp variable debugLevel")
  end
  if icon_refresh == "" or icon_refresh == nil then 
    icon_refresh = "1144" 
    self:setVariable("icon_refresh",icon_refresh)
    self:trace("Added QuickApp variable icon_refresh, please check the icon number")
  end
  if icon_green == "" or icon_green == nil then 
    icon_green = "1145" 
    self:setVariable("icon_green",icon_green)
    self:trace("Added QuickApp variable icon_green, please check the icon number")
  end
  if icon_yellow == "" or icon_yellow == nil then 
    icon_yellow = "1146" 
    self:setVariable("icon_yellow",icon_yellow)
    self:trace("Added QuickApp variable icon_yellow, please check the icon number")
    icon_yellow = tonumber(icon_yellow)
  end
  if icon_red == "" or icon_red == nil then 
    icon_red = "1147"
    self:setVariable("icon_red",icon_red)
    self:trace("Added QuickApp variable icon_red, please check the icon number")
  end
  if icon_error == "" or icon_error == nil then 
    icon_error = "1148"
    self:setVariable("icon_error",icon_error)
    self:trace("Added QuickApp variable icon_error, please check the icon number")
  end
  self:logging(2,"getQuickAppVariables() - Get all Quickapp Variables or create them") 
end


function QuickApp:onInit() --Initialise the QuickApp
  __TAG = fibaro.getName(plugin.mainDeviceId) .." ID:" ..plugin.mainDeviceId
  self:debug("Radiation Monitor - Version "..version .." - ⓒ by SmartHomeEddy")
  
  if not api.get("/devices/"..self.id).enabled then
    self:warning("Device", fibaro.getName(plugin.mainDeviceId), "is disabled")
    return
  end
  
  self:getQuickAppVariables() -- Get all Quickapp Variables or create them
  self:createVariables() -- Setup the global variables
  self:setupChildDevices() -- Setup all child devices
  
  http = net.HTTPClient({timeout=10*1000})
  self:loadMap() -- This is also the main loop
end

-- EOF