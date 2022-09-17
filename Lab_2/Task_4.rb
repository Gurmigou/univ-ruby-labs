def to_binary(val)
  bin = ""
  until val == 0
    bin = "#{val % 2}#{bin}"
    val /= 2
  end
  bin == "" ? "0" : bin
end

decimal = 3489430
binary = to_binary(decimal)
puts "#{decimal} in binary is #{binary}"
