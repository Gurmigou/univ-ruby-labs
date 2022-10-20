puts "Enter a:"
a = gets.to_f
puts "Enter b:"
b = gets.to_f
puts "Enter c:"
c = gets.to_f

puts "Enter x_start"
x_start = gets.to_f
puts "Enter x_end"
x_end = gets.to_f
puts "Enter x_delta"
x_delta = gets.to_f

def get_integer_part(x)
  x.to_i
end

def get_condition(a, b, c)
  a_int = get_integer_part(a)
  b_int = get_integer_part(b)
  c_int = get_integer_part(c)
  a_int | b_int | c_int == 0
end

def func_f(a, b, c, x_start, x_end, x_delta)
  condition = get_condition(a, b, c)
  result = []
  (x_start..x_end).step(x_delta) do |x|
    if c < 0 and x != 0
      func_result = -a * x - c
    elsif c > 0 and x == 0
      func_result = (x - a) / (-c)
    else
      func_result = (b * x) / (c - a)
    end
    result.push([x, (condition) ? func_result.to_i : func_result])
  end
  result
end

result = func_f(a, b, c, x_start, x_end, x_delta)
puts "The result is: #{result}"

def test_func_f_1
  a = 2.5
  b = 3.1
  c = 5
  x_start = 1.1
  x_end = 2.3
  x_delta = 0.2

  should_be_equal = [
    [1.1, 1.364],
    [1.3, 1.612],
    [1.5, 1.86],
    [1.7, 2.108],
    [1.9, 2.356],
    [2.1, 2.604],
    [2.3, 2.852]
  ]

  result = func_f(a, b, c, x_start, x_end, x_delta)

  (0...result.length).each do |i|
    if (result[i][0] - should_be_equal[i][0]).abs > 0.0001 or (result[i][1] - should_be_equal[i][1]).abs > 0.0001
      puts "Test failed"
      return
    end
  end

  puts "Test 1: true"
end

test_func_f_1

def test_func_f_2
  a = 0.5
  b = 0.4
  c = 0.95
  x_start = 1.1
  x_end = 1.8
  x_delta = 0.1

  should_be_equal = [
    [1.1, 0],
    [1.2, 1],
    [1.3, 1],
    [1.4, 1],
    [1.5, 1],
    [1.6, 1],
    [1.7, 1],
    [1.8, 1]
  ]

  result = func_f(a, b, c, x_start, x_end, x_delta)

  (0...result.length).each do |i|
    if (result[i][0] - should_be_equal[i][0]).abs > 0.0001 or (result[i][1] - should_be_equal[i][1]).abs > 0.0001
      puts "Test failed"
      return
    end
  end

  puts "Test 2: true"
end
test_func_f_2