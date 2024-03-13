puts "Where are you? "
user_location = gets.chomp
pp "Checking the weather at #{user_location} " 
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
latitude = location.fetch("lat")
pp longitude = location.fetch("lng")
pp "Your coordinate are #{latitude.to_s},#{longitude.to_s}"

pirate_weather_url = "https://api.pirateweather.net/forecast/" + ENV.fetch('PIRATE_WEATHER_KEY') + "/" + latitude.to_s + "," + longitude.to_s

weather_respo = HTTP.get(pirate_weather_url)
weather_raw = weather_respo.to_s
parsed_weather_respo = JSON.parse(weather_raw)
result_weather_hash = parsed_weather_respo.fetch('currently')
weather_temperature = result_weather_hash.fetch("temperature")
pp "It is currently " + weather_temperature.to_s + "°F"

hourly_weather_hash = parsed_weather_respo.fetch('hourly')
hourly_weather_summary = hourly_weather_hash.fetch('summary')
hourly_weather_data = hourly_weather_hash.fetch('data')
hourly_weather_result = hourly_weather_data.at(0)
hourly_weather_temp = hourly_weather_result.fetch('temperature')
pp "Next hour: #{hourly_weather_summary} and the temperature is going to be #{hourly_weather_temp.to_s}°F"
