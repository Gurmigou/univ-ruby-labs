def to_decimal(val, base = 2)
  value = 0
  val.split('').map(&:to_i).reverse.each_with_index do |num, index|
    if num == 1
      value += base ** index
    end
  end
  value
end

binary = "111100010011"
converted = to_decimal(binary)

puts "#{binary} in decimal is #{converted}"