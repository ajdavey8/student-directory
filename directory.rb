@cohorts = [:january, :february, :march, :april, :may, :june,
   :july, :august, :september, :october, :november, :december]
@students = []
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load a list"
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
    ask_save
  when "4"
    ask_load
  when "9"
    puts "Goodbye"
    exit
  else
    puts "I don't know what you mean, please try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  @name = STDIN.gets.chomp
  while !@name.empty? do
  puts "And which cohort are they in?"
  @cohort = STDIN.gets.chomp
    while !@cohorts.include? @cohort.to_sym
      puts "Please enter valid a cohort"
      @cohort = STDIN.gets.chomp
    end
    add_student
    student_counter
    @name = STDIN.gets.chomp
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

def ask_save
puts "Where would you like to save the students?"
file = STDIN.gets.chomp
save_students(file)
end

def save_students(csv_file)
  File.open(csv_file, "w") do |f|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      f.puts csv_line
    end
  end
end

def ask_load
puts "Which file of students would you like to load?"
file = STDIN.gets.chomp
load_students(file)
end

def load_students(filename)
  file = File.open(filename, "r") do |f|
    f.readlines.each do |line|
      @name, @cohort = line.chomp.split(',')
      add_student
    end
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students("students.csv")
    puts "Loaded students from students.csv"
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exist"
    exit
  end
end

def add_student
  @students << {name: @name, cohort: @cohort.to_sym}
end
try_load_students
interactive_menu

def print_source_code
  $><<IO.read($0)
end
