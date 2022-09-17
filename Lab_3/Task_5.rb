PI = 3.141

puts "Enter N:"
n = gets.to_i
puts "Enter C:"
c = gets.to_i

def y(x, n)
  ((2 * x ** (-1.0 / 3)) / (x ** (2.0 / 3) - 3 * x ** (-1.0 / 3))) - (x ** (2.0 / n) / (x ** (5.0 / 3) - x ** (2.0 / n))) - ((x + 1) / ((x ** 2 - 4 * x + 3) == 0 ? 1 : (x ** 2 - 4 * x + 3)))
end

def z(x, n, c)
  (Math.sin(9.0 / 8 * PI + x / 4) ** 2 - Math.sin(7.0 / n * PI + x / (c ** x)) ** 2 + (Math.tan(2 * x - 1) ** (-1.0 / x)))
end

# task 1
def task_1(n, c)
  increment = (n - 1).to_f / (n + c)
  x = 1
  (n + c + 1).times do
    puts "Y(#{x}, #{n}) = #{y(x, n)}"
    x += increment
  end
end

# task 2
def task_2(n, c)
  increment = (PI - (PI / n)).to_f / ((3 / 2) * n + c)
  x = PI / n
  (((3 / 2) * n + c) + 1).times do
    puts "z(#{x}, #{n}, #{c}) = #{z(x, n, c)}"
    x += increment
  end
end

# task 3
def task_3(n, c)
  increment = (c - 2).to_f / (2 * n)
  x = 2
  (2 * n + 1).times do
    if 2 < x and x < n
      puts "f=y: y(#{x}, #{n}) = #{y(x, n)}"
    elsif n < x and x < 2 * n
      puts "f=z: z(#{x}, #{n}, #{c}) = #{z(x, n, c)}"
    else
      puts "f=y+z : y(#{x}, #{n}) + z(#{x}, #{n}, #{c}) = #{y(x, n) + z(x, n, c)}"
    end
    x += increment
  end
end

task_1(n, c)
task_2(n, c)
task_3(4, 8)