# require 'tty-prompt'

class Interface 
    attr_reader :prompt
    attr_accessor :user
    
    def initialize()
        @prompt = TTY::Prompt.new
        #user does exist
    end
    
    def welcome 
        # system "clear"
        puts "Welcome to Bootleg Registrar!"
        choice = self.prompt.select("Are you a new user or returning user?") do |menu|
            menu.choice "New User"
            menu.choice "Returning User"
        end
        case choice
        when "New User"
            User.handle_new_user
        when "Returning User"
            User.handle_returning_user
        end 
    end

    def main_menu
        system "clear"
        choice = self.prompt.select("Welcome! What do you want to do?") do |menu|
            menu.choice "View Current Courses"
            menu.choice "Exit"
        end
        case choice 
        when "View Current Courses"
            courses = self.user.enrollments.map do |enrollment|
                enrollment.course
            end
            puts courses
            sleep 5
            self.main_menu
        when "Exit"
            
        end
    end
end