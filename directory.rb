@cohorts = [:january, :february, :march, :april, :may, :june,
   :july, :august, :september, :october, :november, :december]
@students = []
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
    puts "Now we have #{@students.count} students. Please add another student or exit"
    name=gets.chomp
  end
  @students
end

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

def print_header
  puts "The Students of Villains Academy".center(50)
  puts "---------------".center(50)
end



def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
selecting_cohort
print_header
print(students)
print_footer(students)
