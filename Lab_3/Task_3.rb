def task2
  sum = 0
  (0..8).each {
    |i|
    sum += 1.0 / (3 ** i)
  }
  sum
end

def task3(x)
  print "Enter n:"
  n = gets.to_i

  sum = 0
  fact = 1
  (0..n).each {
    |i|
    sum += (x ** i) / fact
    fact *= (i + 1)
  }
  sum
end

puts "Result task2: #{task2}"

print "Task 3: Enter x:"
x = gets.to_i
puts "Result task3: #{task3(x)}"
