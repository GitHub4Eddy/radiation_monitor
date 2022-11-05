-- Radiation Monitor Classes Child Devices

class 'sensor1'(QuickAppChild)
function sensor1:__init(dev)
  QuickAppChild.__init(self,dev)
end
function sensor1:updateValue(data) 
  self:updateProperty("value", tonumber(sensorData[1].average))
  self:updateProperty("unit", "μSv/h")
  self:updateProperty("log", translation["24h average"])
  self:setName(geoData[1].city)
  self:updateProperty("deviceIcon", data.icon1)
end


class 'sensor2'(QuickAppChild)
function sensor2:__init(dev)
  QuickAppChild.__init(self,dev)
end
function sensor2:updateValue(data) 
  self:updateProperty("value", tonumber(sensorData[2].sample))
  self:updateProperty("unit", "μSv/h")
  self:updateProperty("log", translation["Average"] .." " ..sensorData[2].average .." μSv/h")
  self:setName(geoData[2].city)
  self:updateProperty("deviceIcon", data.icon2)
end


class 'sensor3'(QuickAppChild)
function sensor3:__init(dev)
  QuickAppChild.__init(self,dev)
end
function sensor3:updateValue(data) 
  self:updateProperty("value", tonumber(sensorData[3].sample))
  self:updateProperty("unit", "μSv/h")
  self:updateProperty("log", translation["Average"] .." " ..sensorData[3].average .." μSv/h")
  self:setName(geoData[3].city)
  self:updateProperty("deviceIcon", data.icon3)
end


class 'sensor4'(QuickAppChild)
function sensor4:__init(dev)
  QuickAppChild.__init(self,dev)
end
function sensor4:updateValue(data) 
  self:updateProperty("value", tonumber(sensorData[4].sample))
  self:updateProperty("unit", "μSv/h")
  self:updateProperty("log", translation["Average"] .." " ..sensorData[4].average .." μSv/h")
  self:setName(geoData[4].city)
  self:updateProperty("deviceIcon", data.icon4)
end


class 'sensor5'(QuickAppChild)
function sensor5:__init(dev)
  QuickAppChild.__init(self,dev)
end
function sensor5:updateValue(data) 
  self:updateProperty("value", tonumber(sensorData[5].sample))
  self:updateProperty("unit", "μSv/h")
  self:updateProperty("log", translation["Average"] .." " ..sensorData[5].average .." μSv/h")
  self:setName(geoData[5].city)
  self:updateProperty("deviceIcon", data.icon5)
end


class 'sensor6'(QuickAppChild)
function sensor6:__init(dev)
  QuickAppChild.__init(self,dev)
end
function sensor6:updateValue(data) 
  self:updateProperty("value", tonumber(sensorData[data.sampleMaxID].sample))
  self:updateProperty("unit", "μSv/h")
  self:updateProperty("log", translation["Max measurement"])
  self:setName(geoData[6].city)
  self:updateProperty("deviceIcon", data.icon6)
end


class 'sensor7'(QuickAppChild)
function sensor7:__init(dev)
  QuickAppChild.__init(self,dev)
end
function sensor7:updateValue(data) 
  self:updateProperty("value", tonumber(sensorData[data.averageMaxID].average))
  self:updateProperty("unit", "μSv/h")
  self:updateProperty("log", translation["Max 24h average"])
  self:setName(geoData[7].city)
  self:updateProperty("deviceIcon", data.icon7)
end

-- EOF