

def bubble_sort(arr)

  remaining_iterations=arr.length - 2
  return arr unless remaining_iterations > 0
  swapped=true

  while swapped
    swapped=false
    0.upto(remaining_iterations) do |current_value|
    if (arr[current_value+1]) <= (arr[current_value])
        arr[current_value],arr[current_value+1]= arr[current_value+1], arr[current_value]
        swapped=true
      end
    end
    remaining_iterations -= 1
  end

  arr
end

p bubble_sort([2,9,5,1,6])
p bubble_sort([4,3,78,2,0,2])
