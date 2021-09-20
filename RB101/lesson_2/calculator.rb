puts 'Welcome to the calculator!'

puts 'Enter the first number: '
num1 = gets.chomp

puts 'Enter the second number: '
num2 = gets.chomp

puts 'What operation should be performed? 1) Addition, 2) Subtraction, 3) Muliplitcation, 4) Division'
operator = gets.chomp

if operator == '1'
  result = "#{num1} + #{num2} = #{num1.to_i + num2.to_i}"
elsif operator == '2'
  result = "#{num1} - #{num2} = #{num1.to_i - num2.to_i}"
elsif operator == '3'
  result = "#{num1} * #{num2} = #{num1.to_i * num2.to_i}"
elsif operator == '4'
  result = "#{num1} / #{num2} = #{num1.to_f / num2.to_f}"
end

puts result
