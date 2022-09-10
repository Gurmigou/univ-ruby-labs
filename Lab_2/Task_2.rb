def diap(num_digits, int_num_digits, radix)
  (radix ** int_num_digits) * (1 - (1 / radix ** (num_digits - 1)))
end

result = diap(8, 0, 5)
puts "Result #{result}"