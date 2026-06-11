print "How many scores? "
total_scores = gets.chomp.to_i

highest = 0
lowest = 100 
grades = []
total_grade = ""


while grades.length < total_scores
  print "Enter score #{grades.length + 1}: "
  input = gets.chomp.to_i
  
  if input >= 0 && input <= 100
    grades << input
  else
    puts "invalid input, please enter a number between 0 and 100"
  end
end

sum = grades.sum
avg = sum / total_scores.to_f
if avg >= 90
  total_grade = "A"
elsif avg >= 80
  total_grade = "B"
elsif avg >= 70
  total_grade = "C"
elsif avg >= 60
  total_grade = "D"
else
  total_grade = "F"
end

grades.each do |grade|
  highest = grade if grade > highest
  lowest = grade if grade < lowest
end
puts "\nResults:"
puts "Average     : #{avg}"
puts "Grade : #{total_grade}"
puts "Highest     : #{highest}"
puts "Lowest      : #{lowest}"