def prompt(message)
  # prompt method
  puts "=> #{message}"
end

def valid_number?(num)
  # number validation method
  num.to_i != 0
end

def operation_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt('Welcome to the calculator!')
name = nil
prompt("What's your name? ")
name = gets.chomp.capitalize
loop do
  if name.empty?
    prompt('Please enter a valid name.')
  else
    break
  end
end
prompt("Hi, #{name}!")

# main loop
loop do
  num1 = nil
  num2 = nil
  operator = nil
  # number validation loop
  loop do
    prompt('Enter the first number: ')
    num1 = gets.chomp

    if valid_number?(num1)
      break
    else
      prompt('Looks like you entered an invalid number.')
    end
  end

  # number validation loop
  loop do
    prompt('Enter the second number: ')
    num2 = gets.chomp

    if valid_number?(num2)
      break
    else
      prompt('Looks like you entered an invalid number.')
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to performed?
    1) Addition
    2) Subtraction
    3) Muliplitcation
    4) Division
  MSG

  prompt(operator_prompt)

  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('Please input a valid selection. 1, 2, 3, or 4.')
    end
  end

  prompt("#{operation_message(operator)} the two numbers...")

  result =  case operator
            when '1'
              num1.to_i + num2.to_i
            when '2'
              num1.to_i - num2.to_i
            when '3'
              num1.to_i * num2.to_i
            when '4'
              num1.to_f / num2.to_f
            end

  prompt("The result is #{result}.")
  prompt('Would you like to try again? (Y) to recalculate.')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thanks for trying the calculator! Goodbye.')
