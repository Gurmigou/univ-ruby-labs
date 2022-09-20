c = []
12.times do |i|
    c.push(rand(0..20))
end

puts "Before: Array c: #{c}"

prev = c[c.length - 1]
(0...c.length).each do |i|
  temp = c[i]
  c[i] = prev
  prev = temp
end

puts "After: Array c: #{c}"
