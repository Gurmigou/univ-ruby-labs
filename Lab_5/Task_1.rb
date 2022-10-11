require_relative '../UnitTests'

def integrate_rectangle(a, b, n, dx = (b - a) / n)
  x = a + dx / 2
  sum = 0
  (1..n).each {
    y = yield(x)
    sum += dx * y
    x += dx
  }
  sum
end

def integrate_trapezoid(a, b, n, dx = (b - a) / n)
  x = a + dx
  sum = dx * (yield(a) / 2 - yield(b) / 2)
  loop {
    y = yield(x)
    sum += dx * y
    x += dx
    break if x > b
  }
  sum
end

def f1(x)
  (x ** 2 - 1) * 10 ** (-2 * x)
end

def f2(x)
  1 / (3 + 2 * Math.cos(x))
end

x = integrate_rectangle(0.0, 0.5, 100000.0) { |x| f1(x) }
assert_equal(x, -0.1871460609734634)

x = integrate_trapezoid(0.0, 0.5, 100000.0) { |x| f1(x) }
assert_equal(x, -0.18714606098646508)


x = integrate_rectangle(0.0, Math::PI / 2, 100000.0) { |x| f2(x) }
assert_equal(x, 0.3761373442248007)

x = integrate_trapezoid(0.0, Math::PI / 2, 100000.0) { |x| f2(x) }
assert_equal(x, 0.3761373442316545)