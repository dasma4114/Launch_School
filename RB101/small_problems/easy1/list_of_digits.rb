#Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

def digit_list(num)
  numsplit = num.to_s.split(//)
  numsplit.map { |str| str.to_i }
end
  
print digit_list(12345)