# frozen_string_literal: true

def merge_sort(arr)
  if arr.length < 2
    arr
  else
    left_side = merge_sort(arr.slice!(0, arr.length / 2))
    right_side = merge_sort(arr)
    merge(left_side, right_side)
  end
end

def merge(first, second)
  sorted_arr = []
  while !first.empty? && !second.empty?
    sorted_arr << if first[0] < second[0]
                    first.shift
                  else
                    second.shift
                  end
  end
  sorted_arr.concat(first).concat(second)
end

puts merge_sort([10, 8, 4, 6, 2, 9])
puts merge_sort([4, 2])
