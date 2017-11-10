require "unirest"

system "clear"
puts "Welcome to the Weather app!"
print "Enter a city: "
input_city = gets.chomp
print "Enter a state: "
input_state = gets.chomp
response = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{input_city}%2C%20#{input_state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")

body = response.body
temperature = body["query"]["results"]["channel"]["item"]["condition"]["temp"]
condition = body["query"]["results"]["channel"]["item"]["condition"]["text"]

puts "Today in #{input_city} it is #{temperature} degrees and #{condition.downcase} outside."
