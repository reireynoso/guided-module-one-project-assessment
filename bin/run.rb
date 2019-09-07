require_relative '../config/environment'

puts "hello world"

cli = Interface.new
user_object = cli.welcome
while(!user_object)
    user_object = cli.welcome
end

cli.user = user_object

choice = cli.main_menu

while choice!= "Exit"
    choice = cli.main_menu
end
binding.pry

0
