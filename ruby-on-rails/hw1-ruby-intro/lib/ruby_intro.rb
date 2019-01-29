# When done, submit this entire file to the autograder.
#
# Suqian Wang
# UIN: 825009505

# Part 1

def sum arr
  # YOUR CODE HERE
  return arr.sum(0)
end

def max_2_sum arr
  # YOUR CODE HERE
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
  # YOUR CODE HERE
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
  # YOUR CODE HERE
end

def starts_with_consonant? s
  # YOUR CODE HERE
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
end

# Part 3

class BookInStock
# YOUR CODE HERE
end
