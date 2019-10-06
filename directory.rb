def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)

  student_hash = {}

  students.each do |student|
    cohort = student[:cohort]
    if student_hash[cohort] == nil
      student_hash[cohort] = []
    end
    student_hash[cohort].push(student[:name])
  end

  puts student_hash.map { |k, v|
    puts "#{k.capitalize}" " cohort:".center(100)
    puts v.map { |name| name.to_s.center(100) }
  }

end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(100)
end

def input_students
  existing_cohorts = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
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
      if country == ""
        country = "UK"
      end
    puts "Please enter the student's cohort"
    cohort = gets.chomp.downcase
      if cohort == ""
        cohort = "november"
      end
      while !existing_cohorts.include?(cohort.downcase) do
        puts "Sorry, that cohort doesn't exist, please try again"
        cohort = gets.chomp.downcase
        if existing_cohorts.include?(cohort.downcase)
          break
        end
      end
    # add the student hash to the array
    students << {name: name, country: country, cohort: cohort.to_sym}
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
