@cohorts = [:january, :february, :march, :april, :may, :june,
   :july, :august, :september, :october, :november, :december]
@students = []
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  if name == ''
    puts "No students added to the list"
    exit
  end
  while !name.empty? do
  puts "And which cohort are they in?"
  cohort=gets.chomp
    while !@cohorts.include? cohort.to_sym
      puts "Please enter valid a cohort"
      cohort=gets.chomp
    end
    @students << {name: name, cohort: cohort.to_sym}
    if @students.count == 1
      puts "Now we have #{@students.count} student. Please add another student or exit"
    else
    puts "Now we have #{@students.count} students. Please add another student or exit"
    end
    name=gets.chomp
  end
  @students
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_header
  puts "The Students of Villains Academy".center(50)
  puts "---------------".center(50)
end

def print_footer(students)
  if @students.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

students = input_students
print_header
print(students)
print_footer(students)

#method for cohort selectiion
def selecting_cohort
  puts "select which cohort you would like to view, or type 'all' to view all students"
  @selected=gets.chomp
end

def print(students)
  students.map do |student|
    if student[:cohort] == @selected.to_sym
      puts "#{student[:name]} (#{student[:cohort].capitalize} cohort)".center(50)
    end
    if @selected == 'all'
      puts "#{student[:name]} (#{student[:cohort].capitalize} cohort)".center(50)
    end
  end
end
