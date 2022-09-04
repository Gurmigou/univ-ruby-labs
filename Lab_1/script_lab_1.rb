# Variant 4
# Yehor Bukhanets IPS-31

PI_NUMBER = Math::PI
E_NUMBER = Math::E
COS_24_PI_HALF = Math.cos(24 * (PI_NUMBER / 2))

puts "Enter x variable value: "
x = gets.chomp.to_f
puts "Enter j variable value: "
j = gets.chomp.to_f

nominator = (Math.tan(Math.log(x ** 3).abs) ** 5) + 4.2 * (10 ** (-2.8))
denominator = Math.sqrt((x + E_NUMBER ** j).abs)

v = COS_24_PI_HALF + nominator / denominator
puts "Result V: #{v}"