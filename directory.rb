def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp
  puts "please enter student's age"
  age = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november, age: age}
    puts "Now we have #{students.count} students"
    name=gets.chomp
    break if name.empty?
    puts "And student's age?"
    age=gets.chomp
  end
  students
end

def print_header
  puts "The Students of Villains Academy".center(50)
  puts "---------------".center(50)
end

def print(students)
  count = 0
  while students.count > count
    puts "#{students[count][:name]}, #{students[count][:age]} (#{students[count][:cohort]})".center(50)
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
