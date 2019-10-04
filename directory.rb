def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  for student in students
    puts "#{student[:name]} from #{student[:country]} (#{student[:cohort]} cohort)".center(100)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(100)
end

def input_students
  puts "Please enter the name of a student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter the student's country of origin"
    country = gets.chomp
    # add the student hash to the array
    students << {name: name, country: country, cohort: :november}
    puts "Now we have #{students.count} students, enter another name or press return to finish"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

students = input_students
print_header
print(students)
print_footer(students)
