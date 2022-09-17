# not (A or B) and (A and  not B)
def a_task(a, b)
  not (a or b) and (a and not b)
end

# ! changed <= to or
def b_task(a, b, c, x, y, z)
  ((z != y) or (6 >= y)) and a or b and c and x >= 1.5
end

def c_task(x, y, z)
  (8 - x ** 2 <= z) and (x ** 2 != y ** 2) or (z >= 15)
end

def d_task(x, y, z)
  x > 0 and y < 0 or z >= (x * y - (-y / x)) + (-z)
end

def e_task(a, b, c)
  not (a or b and not (c or (not a or b)))
end

def f_task(x, y)
  (x ** 2 + y ** 2) >= 1 and x >= 0 and y >= 0
end

def g_task(a, b, c)
  (a and (c and b != b or a) or c) and b
end

A = false
B = false
C = true
X = 60
Y = -10
Z = 4

puts "Result a_task: #{a_task(A, B)}"
puts "Result b_task: #{b_task(A, B, C, X, Y, Z)}"
puts "Result c_task: #{c_task(X, Y, Z)}"
puts "Result d_task: #{d_task(X, Y, Z)}"
puts "Result e_task: #{e_task(A, B, C)}"
puts "Result f_task: #{f_task(X, Y)}"
puts "Result g_task: #{g_task(A, B, C)}"

def subtask_2(x, y, p)
  ((y * y - x) > x * x) or (Math.cos(x) > 0) and not p
end

puts "Result subtask_2: #{subtask_2(-0.5, -1, true)}"