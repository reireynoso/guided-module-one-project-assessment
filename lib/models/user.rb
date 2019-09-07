class User < ActiveRecord::Base
    has_many :enrollments 
    has_many :courses, through: :enrollments

    def self.handle_new_user
        puts "Welcome! Please provide name:"
        name = gets.chomp
        puts "Please provide age:"
        age = gets.chomp
        self.create(name: name, age: age)
    end

    def self.handle_returning_user
        puts "Welcome back! Please provide name"
        name = gets.chomp
        self.find_by(name: name)
    end

    
end