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

  def my_select
    return to_enum(:my_select) unless block_given?

    new_array = []
    self.each do |item|
      if yield(item)
        new_array << item
      end
    end
    new_array
  end

  def my_all?
    self.each do |item |
      if block_given?
        unless yield(item)
          return false
        end
      else
        unless item
          return false
        end
      end
    end
    true
  end

  def my_any?(&obj)
    self.each do | item |
      if obj.call(item)
        return true
      end
    end
    false
  end

  def my_none?
    self.each do |item|
      return false if yield(item)
    end
    true
  end

  def my_count
    return length unless block_given?

    count = 0
    self.each do |item|
      count += 1 if yield(item)
    end
    count
  end
end
