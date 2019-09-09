require_relative '../config/environment'

puts "hello world"

cli = Interface.new
user_object = cli.welcome

while user_object == nil
    user_object = cli.welcome
end

cli.user = user_object

cli.main_menu

# puts user_object.name
# binding.pry
0
