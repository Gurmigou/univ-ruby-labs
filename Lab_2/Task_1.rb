points = [[114, 146], [147, 106], [167, 84], [224, 56], [277, 47],
       [373, 41], [441, 45], [456, 101], [453, 147], [453, 213],
       [425, 245], [382, 270], [330, 273], [290, 248], [300, 199],
       [238, 195], [197, 212], [151, 209], [105, 190], [104, 163]]

LENGTH = points.length

sum = 0
LENGTH.times do |i|
  p1 = points[i % LENGTH]
  p2 = points[(i + 1) % LENGTH]
  sum += (p1[0] + p2[0]) * (p1[1] - p2[1])
end

square = 0.5 * sum.abs
puts "Square result: #{square}"