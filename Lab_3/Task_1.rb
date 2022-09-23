require_relative '../UnitTests'

def a_task(a, b)
  not (a or b) and (a and not b)
end

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

def subtask_2(x, y, p)
  ((y * y - x) > x * x) or (Math.cos(x) > 0) and not p
end

A = false
B = false
C = true

X = 60
Y = -10
Z = 4

# Testing
def test_a_task
  puts 'A task'
  assert_equal(false, a_task(A, B))
end

def test_b_task
  puts 'B task'
  assert_equal(false, b_task(A, B, C, X, Y, Z))
end

def test_c_task
  puts 'C task'
  assert_equal(true, c_task(X, Y, Z))
end

def test_d_task
  puts 'D task'
  assert_equal(true, d_task(X, Y, Z))
end

def test_e_task
  puts 'E task'
  assert_equal(true , e_task(A, B, C))
end

def test_f_task
  puts 'F task'
  assert_equal(false , f_task(X, Y))
end

def test_g_task
  puts 'G task'
  assert_equal(false, g_task(A, B, C))
end

def test_subtask_2
  puts 'Subtask 2'
  assert_equal(false, subtask_2(-0.5, -1, true))
end

test_a_task
test_b_task
test_c_task
test_d_task
test_e_task
test_f_task
test_g_task
test_subtask_2