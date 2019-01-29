# When done, submit this entire file to the autograder.
#
# Suqian Wang
# UIN: 825009505

# Part 1

def sum arr
  return arr.sum(0)
end

def max_2_sum arr
  if arr.empty?
    return 0

  elsif arr.length == 1
    return arr.first

  else
    # find the largest item in the array
    arr_cp = arr
    max = arr_cp.max
    # find the index of the largest item in the array
    max_item_index = arr_cp.index(max)
    # delete the largest item
    arr_cp.delete_at(max_item_index)
    # find the second largest item in the array
    second_max = arr_cp.max
    return max + second_max
  end

end

def sum_to_n? arr, n
  # find all combination for any 2 items in the array and put it in a new array
  new_arr = arr.combination(2).to_a
  # determine if any element (which is a 2 items subarray) in the new array sum is n or not
  if new_arr.any? { |obj| obj.sum == n}
    return true
  else
    return false
  end
end

# Part 2

def hello(name)
  # str = "Hello, "
  # str.concat(name)
  # could also use string interpolation
  return "Hello, #{name}"
end

def starts_with_consonant? s
  # check if the string starts with vowel or non-letter or if the string is empty
  if s.start_with?('A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u') || s.empty? || !s.chr.match?(/[[:alpha:]]/)
    return false
  else
    return true
  end
end

def binary_multiple_of_4? s
  # check if the string is empty, or the string has a character that is not 0 or 1 (the string is not a binary number)
  # or the integer that the string represent is not a multiple of 4
  if s.empty? || s.each_char.any?{ |c| (c != "0" && c != "1") } || s.to_i % 4 != 0
    return false
  else
    return true
  end
end

# Part 3

class BookInStock
# YOUR CODE HERE
end
