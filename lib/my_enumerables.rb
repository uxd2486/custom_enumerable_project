module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    unless block_given?
      return to_enum(:my_each)
    end

    self.each { |item|
      yield item
    }
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    count = 0
    self.each do |item|
      yield(item, count)
      count += 1
    end
    self
  end
end
