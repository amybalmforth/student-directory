
require 'csv'

@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "5. Delete the list from students.csv"
  puts "9. Exit" # because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
    puts "List of students was saved to students.csv, #{@students.count} total students on list"
  when "4"
    load_students
    puts "Loaded students from students.csv, #{@students.count} total students on list"
  when "5"
    delete_students
    puts "Deleted all students from students.csv, #{@students.count} total students on list"
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you mean, try again"
  end
end

def load_students
  puts "Which file do you want to load?"
  file = STDIN.gets.chomp
  CSV.foreach(file) do |row|
    @name, cohort = row.shift
    write_students
  end
end

def save_students
  puts "Which file do you want to save to?"
  file = STDIN.gets.chomp
  # open the file for writing
  CSV.open(file, "wb") do |csv|
  # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data
      csv.puts csv_line
    end
  end
end

def input_students
  puts "Please enter the names of the students you wish to add"
  puts "To finish, just hit return twice"
  # get the first name
  @name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !@name.empty? do
    # add the student hash to the array
    write_students
    puts "Added student, now #{@students.count} students total"
    # get another name from the user
    @name = STDIN.gets.chomp
  end
end

def write_students
  @students << {name: @name, cohort: :november}
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(100)
end

def delete_students # delete the list of students from CSV
  CSV.open("students.csv", "w") do |csv|
  @students.clear
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
