require 'barometer'

def get_locations_weather(location)
	@barometer = Barometer.new(location).measure
end

puts "Where are you? Enter a zipcode"
location = gets.chomp.downcase
weather = get_locations_weather (location)

puts "Your current weather is " + weather.current.condition + " with the temperature of " + weather.current.temperature.f.to_s + "F.\n\n"

tomorrow = Time.now.strftime('%d').to_i + 1

weather.forecast.each do |forecast|
	day = forecast.starts_at.day

	if day == tomorrow
		dayName = "Tomorrow"
	else
		dayName = forecast.starts_at.strftime('%A')
	end

	puts dayName +" is going to be " + forecast.icon + " with a low of " + forecast.low.f.to_s + "F and a high of " + forecast.high.f.to_s + "F."
end
