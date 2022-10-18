require 'date'

class LibraryRecord
  attr_reader :book_name
  attr_reader :surname
  attr_reader :date_of_order
  attr_reader :date_of_issue

  def initialize(book_name, surname, date_of_order, date_of_issue)
    @book_name = book_name
    @surname = surname
    @date_of_order = date_of_order
    @date_of_issue = date_of_issue
  end

  def to_s
    "#{@book_name}, #{@surname}, #{@date_of_order}, #{@date_of_issue}"
  end
end

array = [
  LibraryRecord.new('Book_1', 'Ivanov', '2018-01-01', '2018-01-10'),
  LibraryRecord.new('Book_1', 'Petrenko', '2020-09-10', '2020-09-11'),
  LibraryRecord.new('Book_2', 'Petrov', '2019-08-03', 'x'),
  LibraryRecord.new('Book_3', 'Petrenko', '2021-12-04', '2021-12-08'),
  LibraryRecord.new('Book_3', 'Nikitenko', '2020-03-22', '2020-05-28'),
  LibraryRecord.new('Book_4', 'Sagaidachnyi', '2021-10-06', '2021-10-15'),
  LibraryRecord.new('Book_1', 'Kovalenko', '2018-08-07', 'x'),
]

# the least time the book was found
def task_1(array)
  filtered = array.select { |record| record.date_of_issue != 'x' }
  filtered.min_by { |record| (Date.parse(record.date_of_issue) - Date.parse(record.date_of_order)).to_i }
end

# how many orders were not issued
def task_2(array)
  array.count { |record| record.date_of_issue == 'x' }
end

# person who borrowed the book max number of times
def task_3(array)
  array.group_by(&:surname)
       .max_by { |_, records| records.count }[0]
end

# the most popular book
def task_4(array)
  array.group_by(&:book_name)
       .max_by { |_, records| records.count }[0]
end

# how many different people ordered top 3 books
def task_5(array)
  array.group_by(&:book_name)
       .max_by(3) { |_, records| records.count }
       .map { |_, records| records.map(&:surname) }
       .flatten.uniq.count
end

puts "Task 1: #{task_1(array)}"
puts "Task 2: #{task_2(array)}"
puts "Task 3: #{task_3(array)}"
puts "Task 4: #{task_4(array)}"
puts "Task 5: #{task_5(array)}"