def sum_to(n)
  if n <= 0
    nil
  elsif n == 1
    1
  else
    n + sum_to(n-1)
  end
end

def add_numbers(nums_array)
  if nums_array.size == 1
    nums_array[0]
  else
    nums_array[0] + add_numbers(nums_array.drop(1))
  end
end

def gamma_fnc(n)
  if n <= 0
    nil
  elsif n <= 2	
    1
  else
    (n-1) * gamma_fnc(n-1)
  end
end

