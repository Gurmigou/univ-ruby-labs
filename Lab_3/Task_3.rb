require_relative '../UnitTests'

def task2
  sum = 0
  (0..8).each {
    |i|
    sum += 1.0 / (3 ** i)
  }
  sum
end

def task3(x, n)
  sum = 0
  fact = 1
  (0..n).each {
    |i|
    sum += (x ** i) / fact
    fact *= (i + 1)
  }
  sum
end

def test_task2
  puts 'Task 2'
  assert_equal(1.499923792104862, task2)
end

def test_task3
  puts 'Task 3'
  assert_equal(1.0, task3(0, 0))
  assert_equal(72003879898, task3(25, 48))
  assert_equal(-8, task3(-4, 18))
  assert_equal(1, task3(19, 0))
  assert_equal(2, task3(1, 2))
end

test_task2
test_task3
