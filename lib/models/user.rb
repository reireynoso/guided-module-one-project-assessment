# require 'tty-prompt'
class User < ActiveRecord::Base
    has_many :enrollments 
    has_many :courses, through: :enrollments

    def self.tty_prompt
        TTY::Prompt.new
    end

    def self.handle_new_user
        
        name = self.tty_prompt.ask("What is name?")
        age = self.tty_prompt.ask("What is age?")
        User.create(name: name , age: age)

    end

    def self.handle_returning_user
        name = self.tty_prompt.ask("Welcome back! What is your name?")
        User.find_by(name: name)
    end
    
end