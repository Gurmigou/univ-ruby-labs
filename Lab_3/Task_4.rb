EPSILON = 0.00001
def factorial(n)
  (1..n).reduce(:*) || 1
end

SUM_1_RESULT = 0.0000214335
def sum1
  n = 2
  sum = 0
  loop do
    sum += (factorial(n - 1).to_f / factorial(n + 1)) ** (n * (n + 1))
    if (sum - SUM_1_RESULT).abs < EPSILON
      puts "Stopped on n = #{n}"
      return sum
    end
    n += 1
  end
end
puts "#{sum1}"

SUM_2_RESULT = -(Math::PI ** 2) / 12
def sum2
  n = 1
  sum = 0
  loop do
    sum += (-1.0) ** n * (1 / (n ** 2))
    if (sum - SUM_2_RESULT).abs < EPSILON
      puts "Stopped on n = #{n}"
      return sum
    end
    n += 1.0
  end
end
puts "#{sum2}"

SUM_3_RESULT = 0.028942
def sum3
  n = 1
  sum = 0
  loop do
    sum += ((factorial(3 * n - 1).to_f * factorial(3 * n)) / (factorial(4 * n) * 3 ** (2 * n) * factorial(2 * n)))
    if (sum - SUM_3_RESULT).abs < EPSILON
      puts "Stopped on n = #{n}"
      return sum
    end
    n += 1.0
  end
end
puts "#{sum3}"
