puts "Where are you from? "
user_location = gets.chomp
pp user_location 
map_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=" + ENV.fetch('GMAPS_KEY')

require 'http'
get_respo = HTTP.get(map_url)
raw_input = get_respo.to_s
require 'json'
parsed_respo = JSON.parse(raw_input)
result_hash = parsed_respo.fetch("results")
result_array = result_hash.at(0)
geo = result_array.fetch("geometry")
location = geo.fetch("location")
pp latitude = location.fetch("lat")
pp longitude = location.fetch("lng")

#pirate_weather_url = "https://api.pirateweather.net/forecast/" + ENV.fetch('PIRATE_WEATHER_KEY') + "/" + latitude.to_s + "," + longitude.to_s

#weather_respo = HTTP.get(pirate_weather_url)
#pp weather_raw = weather_respo.to_s
#parsed_weather_respo = JSON.parse(weather_raw)
#pp parsed_weather_respo.keys
