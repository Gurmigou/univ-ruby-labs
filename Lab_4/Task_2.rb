a = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

b = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

def multiply(a, b)
  c = Array.new(a.length) { Array.new(b[0].length) }
  (0...a.length).each do |i|
    (0...b[0].length).each do |j|
      c[i][j] = 0
      (0...a[0].length).each do |k|
        c[i][j] += a[i][k] * b[k][j]
      end
    end
  end
  c
end

c = multiply(a, b)

puts "Matrix C: #{c}"

