def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header(students)
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

def print_header(students)
  if students.length > 0
    puts "The students of Villains Academy".center(100)
    puts "-------------".center(100)
  end
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
  if students.count > 1
    puts "Overall, we have #{students.count} great students".center(100)
  elsif students.count == 1
    puts "Overall, we have #{students.count} great student".center(100)
  elsif students.count == 0
    puts "We have no students".center(100)
  end
end

def input_students
  existing_cohorts = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  puts "Please enter the name of a student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.strip
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter the student's country of origin"
    country = gets.strip
      if country == ""
        country = "UK"
      end
    puts "Please enter the student's cohort"
    cohort = gets.strip.downcase
      if cohort == ""
        cohort = "november"
      end
      while !existing_cohorts.include?(cohort.downcase) do
        puts "Sorry, that cohort doesn't exist, please try again"
        cohort = gets.strip.downcase
        if existing_cohorts.include?(cohort.downcase)
          break
        end
      end
    # add the student hash to the array
    students << {name: name, country: country, cohort: cohort.to_sym}
    if students.count <= 1
      puts "Now we have #{students.count} student, enter another name or press return to finish"
    else
      puts "Now we have #{students.count} students, enter another name or press return to finish"
    end
    # get another name from the user
    name = gets.strip
  end
  # return the array of students
  students
end

interactive_menu
