require_relative '../UnitTests'

def Y(x)
  case x
  when -4..0
    return ((x - 2).abs / (x ** 2 * Math.cos(x))) ** (1.0 / 7.0)
  when 0..12
    return 1.0 / (Math.tan(x + Math.exp(-x)) / Math.sin(x) ** 2) ** (1.0 / 4.5)
  else
    return 1 / (1 + x / (1 + x / (1 + x)))
  end
end

def testY
  puts 'Y task'
  assert_equal(-1, Y(-5))
  assert_equal(0.6517668312090475, Y(1))
  assert_equal(0.09575438240956531, Y(18.4))
  assert_equal(-1, Y(-9))
  assert_equal(0, Y(28))
end

testY