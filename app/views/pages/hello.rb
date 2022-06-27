require 'json'
require 'open-uri'
require_relative './api_key.rb'

key_api = $api_key

def get_coord(key, city)
    
    url = "http://api.openweathermap.org/geo/1.0/direct?q=#{city}&limit=1&appid=" + key
    
    file = URI.open(url)
    contents = file.read
    
    lat_coord = JSON.parse(contents)[0]["lat"]
    lon_coord = JSON.parse(contents)[0]["lon"]

    return [lat_coord, lon_coord]
end

barca_coord = get_coord(key_api, "Barcelona")
fn_coord = get_coord(key_api, "Friedrichshafen")

puts(barca_coord)
