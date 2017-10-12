@cohorts = [:january, :february, :march, :april, :may, :june,
   :july, :august, :september, :october, :november, :december]
@students = []
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, please try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty? do
  puts "And which cohort are they in?"
  cohort=gets.chomp
    while !@cohorts.include? cohort.to_sym
      puts "Please enter valid a cohort"
      cohort=gets.chomp
    end
    @students << {name: name, cohort: cohort.to_sym}
    student_counter
    name=gets.chomp
  end
end

def student_counter
  if @students.count == 1
    puts "Now we have #{@students.count} student. Please add another student or exit"
  else
  puts "Now we have #{@students.count} students. Please add another student or exit"
  end
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(50)
  end
end

def print_header
  puts "The Students of Villains Academy".center(50)
  puts "---------------".center(50)
end

def print_footer
  if @students.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

interactive_menu
