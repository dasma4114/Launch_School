#Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

def odd(num)
  num.odd?
end

p odd(2)
p odd(-3)
p odd(0)