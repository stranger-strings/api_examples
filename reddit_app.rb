require "unirest"

while true
  system "clear"
  puts "Welcome to the Reddit app!"
  puts

  response = Unirest.get("https://www.reddit.com/r/programming.json")
  posts = response.body["data"]["children"]

  index = 0
  posts.length.times do
    post = posts[index]
    puts "#{index}. #{post["data"]["title"]}"
    index = index + 1
  end
  puts

  puts "Enter a number to see comments for that post"
  post_index = gets.chomp.to_i

  permalink = posts[post_index]["data"]["permalink"]
  response = Unirest.get("https://www.reddit.com#{permalink}.json")
  comments = response.body[1]["data"]["children"]

  index = 0
  comments.length.times do
    comment = comments[index]
    author = comment["data"]["author"]
    body = comment["data"]["body"]
    puts "Author: #{author}"
    puts body
    puts 
    index = index + 1
  end

  puts "Press enter to continue, q to quit"
  input_choice = gets.chomp
  if input_choice == "q"
    system "clear"
    puts "Thank you, goodbye!"
    break
  end
end
