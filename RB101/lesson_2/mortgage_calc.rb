def prompt(message)
  puts "=>#{message}"
end

def verify_num(num)
  num.empty? || num.to_f <= 0 ? false : true
end

def calculate_monthly_payment(loan_amount,
                              monthly_interest_rate,
                              monthly_loan_duration)
  loan_amount *
    (monthly_interest_rate / (1 - (1 +
    monthly_interest_rate)**(- monthly_loan_duration)))
end

prompt('Welcome to the loan calculator!')
prompt('-------------------------------')
prompt('Please enter your name: ')
name = gets.chomp
prompt("Hi, #{name.capitalize}")

loop do
  loan_amount = ''
  loop do
    prompt('Please enter the loan amount: ')
    loan_amount = gets.chomp
    verify_num(loan_amount) ? break : prompt('Please enter a valid number.')
  end

  loan_duration_in_years = ''
  loop do
    prompt('Please enter the length of time for the loan: (in years)')
    loan_duration_in_years = gets.chomp
    verify_num(loan_duration_in_years) ? break : prompt('Enter a valid number.')
  end

  annual_interest_rate = ''
  interest_rate_msg = <<-MSG
    Please enter the annual interest rate: 
    (eg.5 for 5% and 
    2.5 for 2.5%)
  MSG
  loop do
    prompt(interest_rate_msg)
    annual_interest_rate = gets.chomp
    verify_num(annual_interest_rate) ? break : prompt('Enter a valid number.')
  end

  loan_amount = loan_amount.to_f
  monthly_loan_duration = loan_duration_in_years.to_i * 12
  monthly_interest_rate = (annual_interest_rate.to_f / 100) / 12
  monthly_payment = calculate_monthly_payment(loan_amount,
                                              monthly_interest_rate,
                                              monthly_loan_duration)

  prompt("Your monthly payment will be #{format('%.2f', monthly_payment)}")

  prompt('Would you like to do another calculation? (Y to exit)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the payment calculator #{name.capitalize}!")
