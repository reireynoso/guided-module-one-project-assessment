Enrollment.destroy_all
User.destroy_all
Course.destroy_all

user1 = User.create(name: "John Doe", age: 0)

course1 = Course.create(name: "Coding 1", subject: "Programming", teacher_name: "Erik")
course2 = Course.create(name: "Pre-K Nursing", subject: "Science", teacher_name: "Leinald")
course3 = Course.create(name: "Pre-K Math", subject: "Math", teacher_name: "Reizl")

enrollment = Enrollment.create(user_id: user1.id, course_id: course1.id)
enrollment1 = Enrollment.create(user_id: user1.id, course_id: course2.id)
enrollment2 = Enrollment.create(user_id: user1.id, course_id: course3.id)

puts 'loaded'

# binding.pry