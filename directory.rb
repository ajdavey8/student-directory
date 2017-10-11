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

def print_header
  puts "The Students of Villains Academy".center(50)
  puts "---------------".center(50)
end

def print(students)
  count = 0
  while students.count > count
    puts "#{students[count][:name]}, (#{students[count][:cohort]})".center(50)
    count = count + 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
