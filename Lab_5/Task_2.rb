require_relative '../UnitTests'

def series(f, x, n)
  x_rage = (Math::PI / 5)..(4 * Math::PI / 5)
  n_range = 18..58
  eps = 0.0001

  unless x_rage.include? x
    raise "'x' is out of range"
  end

  res, i, cur = 0.0, n, eps
  if n_range.include? n
    (1..n).each do |i|
      cur = f.call(x, i)
      res += cur
    end
  else
    i = 0
    while cur.abs >= eps
      cur = f.call(x, i)
      res += cur
      i += 1
    end
  end
  res
end

def fun(x, i)
  (-1) ** (i + 1) * (Math.sin(i * x) / i)
end

puts "Sum"
sum = series(method(:fun), 1.5, 18)
assert_equal(sum, 0.7323432698538715)
