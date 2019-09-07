require 'tty-prompt'

class Interface

    attr_accessor :prompt, :user

    def initialize()
        @prompt = TTY::Prompt.new
    end
    
    def welcome 
        puts "Welcome to Bootleg Registrar!"
        # puts "Are you a returning user or new user?"
        # answer = gets.chomp
        # choice = self.prompt.select("Are you returning user or new user?", [
        #     {name: "Returning User", value: 1},
        #     {name: "New User", value: 2}
        # ])

        choice = self.prompt.select("New User or Returning User?") do |menu|
            menu.choice "New User"
            menu.choice "Returning User"
        end
        # binding.pry
        welcome_handler(choice)
    end

    def welcome_handler(choice)
        # binding.pry
        case choice
        when "New User"
            User.handle_new_user
        when "Returning User"
            User.handle_returning_user
        end
    end

    def main_menu
        # system "clear"
        choice = self.prompt.select("Welcome #{self.user.name}! What would you like to do?") do |menu|
            menu.choice "View Courses", -> {self.user.courses.map do |course| course.name end}
            menu.choice "Register for Course", -> {"hey"}
            menu.choice "Exit"
        end
        if choice == "Exit"
            return choice
        else
            puts choice
        end
        # menu_handler(choice)
    end

    # def menu_handler(choice)
    #     case choice
    #     when "View Courses"
    #         Course.handle_view_course
    #     when "Register"
    # end
end