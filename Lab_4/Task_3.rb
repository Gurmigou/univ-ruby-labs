def create_user_input_matrix(row, column)
  def input_number_valid(num)
    Integer(num) rescue false
  end

  matrix = Array.new(row) { Array.new(column) }
  (0...row).each do |i|
    (0...column).each do |j|
      while true
        print "Input matrix[#{i}][#{j}]: "
        input = gets.chomp
        if input_number_valid(input)
          matrix[i][j] = input.to_i
          break
        end
      end
    end
  end
  matrix
end

def get_input_matrix_dimension
  def dimension_valid(num)
    Integer(num) && (num.to_i >= 3 and num.to_i <= 9) rescue false
  end

  while true
    print "Input matrix dimension (3 <= n <= 9):"
    dim = gets.chomp
    if dimension_valid(dim)
      return dim.to_i
    end
  end
end

def create_user_input_values_row(dimension)
  print "Input values row:\n"
  values_matrix = create_user_input_matrix(dimension, 1)
  values = []
  (0...dimension).each do |i|
    values.push(values_matrix[i][0])
  end
  values
end

def gauss(matrix, values)
  def add_rows(row_to_add, row, coef, values, row_to_add_index, row_index)
    (0...row_to_add.length).each do |i|
      row_to_add[i] += coef * row[i]
    end
    values[row_to_add_index] += coef * values[row_index]
  end

  n = matrix.length
  (0...n).each do |row|
    x = matrix[row][row].to_r
    (0...n).each do |column|
      matrix[row][column] /= x
    end
    values[row] /= x

    (0...n).each do |zero_row|
      unless zero_row == row
        zero_coef = matrix[zero_row][row]
        add_rows(matrix[zero_row], matrix[row], -zero_coef, values, zero_row, row)
      end
    end
  end
  values
end

dimension = get_input_matrix_dimension
matrix = create_user_input_matrix(dimension, dimension)
values = create_user_input_values_row(dimension)

result = gauss(matrix, values)
puts "Result: #{result}"