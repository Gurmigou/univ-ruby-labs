class Enrollee
  attr_reader :id
  attr_reader :first_name
  attr_reader :middle_name
  attr_reader :last_name
  attr_reader :address
  attr_reader :phone_number
  attr_reader :grades

  def initialize(id, first_name, middle_name, last_name, address, phone_number, grades)
    @id = id
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
    @address = address
    @phone_number = phone_number
    @grades = grades
  end

  def to_s
    "#{@id}, #{@first_name}, #{@middle_name}, #{@last_name}, #{@address}, #{@phone_number}, #{grades}"
  end

  def hast_at_least_one_low_grade
    @grades.any? { |grade| grade < 2.5 }
  end

  def grade_sum
    @grades.sum
  end

  def has_normal_sum
    val = @grades.sum / @grades.count
    val >= 2.5 and val < 3.5
  end
end

enrollee_list = [
  Enrollee.new(1, 'Michael', 'Lee', 'Born', 'Seilhouse', '+380973774457', [3.2, 3.5, 3.0, 3.1, 3.25]),
  Enrollee.new(2, 'Philip', 'Kirill', 'Rick', 'Kyiv', '+380503332226', [2.2, 3.8, 1.75, 2.1, 3.15]),
  Enrollee.new(3, 'Katerin', 'Motte', 'George', 'Atlanta', '+198745671', [2.4, 3.6, 2.75, 3.15, 3.2]),
  Enrollee.new(4, 'Kate', 'Kurt', 'Mathew', 'Kharkov', '+380937670671', [4, 3.8, 4, 3.1, 3.45]),
  Enrollee.new(5, 'Alex', 'Peter', 'Sigurd', 'Sheffield', '+447587481337', [2.5, 2.9, 3.1, 2.95, 2.6]),
  Enrollee.new(6, 'Davin', 'Fedor', 'Alexander', 'Poltava', '+3809383848876', [1.75, 2.9, 3.8, 2.95, 3.8]),
  Enrollee.new(7, 'Tom', 'Lee', 'Joe', 'Los-Angeles', '+13079442338', [2.2, 3.5, 2, 3.1, 2]),
  Enrollee.new(8, 'Bob', 'Kurt', 'Tim', 'Stoksbridge', '+447929181987', [1.2, 1.5, 3.0, 2.8, 2.3]),
  Enrollee.new(9, 'Ann', 'Emil', 'Bugatti', 'Warsaw', '+489122344556', [2.2, 3.5, 2.75, 3.1, 3.25]),
  Enrollee.new(10, 'Marie', 'Sophi', 'Lancaster', 'Lviv', '+380655553739', [3.5, 3.5, 2.1, 4, 3.65]),
]

# enrollees who has at least one low grade
def task_1(enrollee_list)
  enrollee_list.select(&:hast_at_least_one_low_grade).map(&:to_s)
end

# enrollees whose sum of grades is greater than given value
def task_2(enrollee_list, sum)
  enrollee_list.select { |enrollee| enrollee.grade_sum > sum }.map(&:to_s)
end

# top n enrollees sorted by sum of grades
def task_3_a(enrollee_list, limit)
  enrollee_list.sort_by(&:grade_sum).reverse.first(limit).map(&:to_s)
end

# enrollees who have normal sum of grades
def task_3_b(enrollee_list)
  enrollee_list.select(&:has_normal_sum).map(&:to_s)
end

puts "Task 1: #{task_1(enrollee_list)}"
puts "Task 2: #{task_2(enrollee_list, 18)}"
puts "Task 3_a: #{task_3_a(enrollee_list, 3)}"
puts "Task 3_b: #{task_3_b(enrollee_list)}"

puts "TESTS"
def test_task_1(enrollee_list)
  should_equal_list = [
    '2, Philip, Kirill, Rick, Kyiv, +380503332226, [2.2, 3.8, 1.75, 2.1, 3.15]',
    '3, Katerin, Motte, George, Atlanta, +198745671, [2.4, 3.6, 2.75, 3.15, 3.2]',
    '6, Davin, Fedor, Alexander, Poltava, +3809383848876, [1.75, 2.9, 3.8, 2.95, 3.8]',
    '7, Tom, Lee, Joe, Los-Angeles, +13079442338, [2.2, 3.5, 2, 3.1, 2]',
    '8, Bob, Kurt, Tim, Stoksbridge, +447929181987, [1.2, 1.5, 3.0, 2.8, 2.3]',
    '9, Ann, Emil, Bugatti, Warsaw, +489122344556, [2.2, 3.5, 2.75, 3.1, 3.25]',
    '10, Marie, Sophi, Lancaster, Lviv, +380655553739, [3.5, 3.5, 2.1, 4, 3.65]'
  ]
  result = task_1(enrollee_list)
  puts "Test task 1: #{result == should_equal_list}"
end
test_task_1(enrollee_list)

def test_task_2(enrollee_list)
  should_equal_list = [
    '4, Kate, Kurt, Mathew, Kharkov, +380937670671, [4, 3.8, 4, 3.1, 3.45]'
  ]
  result = task_2(enrollee_list, 18)
  puts "Test task 2: #{result == should_equal_list}"
end
test_task_2(enrollee_list)

def test_task_3_a(enrollee_list)
  should_equal_list = [
    '4, Kate, Kurt, Mathew, Kharkov, +380937670671, [4, 3.8, 4, 3.1, 3.45]',
    '10, Marie, Sophi, Lancaster, Lviv, +380655553739, [3.5, 3.5, 2.1, 4, 3.65]',
    '1, Michael, Lee, Born, Seilhouse, +380973774457, [3.2, 3.5, 3.0, 3.1, 3.25]'
  ]
  result = task_3_a(enrollee_list, 3)
  puts "Test task 3_a: #{result == should_equal_list}"
end
test_task_3_a(enrollee_list)

def test_task_3_b(enrollee_list)
  should_equal_list = [
    '1, Michael, Lee, Born, Seilhouse, +380973774457, [3.2, 3.5, 3.0, 3.1, 3.25]',
    '2, Philip, Kirill, Rick, Kyiv, +380503332226, [2.2, 3.8, 1.75, 2.1, 3.15]',
    '3, Katerin, Motte, George, Atlanta, +198745671, [2.4, 3.6, 2.75, 3.15, 3.2]',
    '5, Alex, Peter, Sigurd, Sheffield, +447587481337, [2.5, 2.9, 3.1, 2.95, 2.6]',
    '6, Davin, Fedor, Alexander, Poltava, +3809383848876, [1.75, 2.9, 3.8, 2.95, 3.8]',
    '7, Tom, Lee, Joe, Los-Angeles, +13079442338, [2.2, 3.5, 2, 3.1, 2]',
    '9, Ann, Emil, Bugatti, Warsaw, +489122344556, [2.2, 3.5, 2.75, 3.1, 3.25]',
    '10, Marie, Sophi, Lancaster, Lviv, +380655553739, [3.5, 3.5, 2.1, 4, 3.65]'
  ]
  result = task_3_b(enrollee_list)
  puts "Test task 3_b: #{result == should_equal_list}"
end
test_task_3_b(enrollee_list)