require 'yaml'

MESSAGES = YAML.load_file('prompts.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_num?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def get_loan_amount
  total_loan = ''
  loop do
    prompt(MESSAGES[:loan_amount])
    total_loan = gets.chomp
    if valid_num?(total_loan)
      return total_loan
    else
      prompt(MESSAGES[:invalid_num])
    end
  end
end

def get_loan_duration
  yearly_duration = ''
  loop do
    prompt(MESSAGES[:loan_duration])
    yearly_duration = gets.chomp
    if valid_num?(yearly_duration)
      return yearly_duration
    else
      prompt(MESSAGES[:invalid_num])
    end
  end
end

def get_interest_rate
  annual_interest = ''
  loop do
    prompt(MESSAGES[:interest])
    annual_interest = gets.chomp
    if valid_num?(annual_interest)
      return annual_interest
    else
      prompt(MESSAGES[:invalid_num])
    end
  end
end

def convert_loan_duration(num)
  num * 12
end

def year_to_month_interest(float)
  (float / 100) / 12
end

def display_monthly_pay(amount, duration, interest)
  monthly_pay = amount * (interest / (1 - (1 + interest)**(-duration)))
  prompt(MESSAGES[:monthly_pay] + '$' + format('%0.2f', monthly_pay))
end

# main loop

system 'clear'
prompt(MESSAGES[:welcome])
loan_amount = get_loan_amount.to_f
monthly_duration = convert_loan_duration(get_loan_duration.to_f)
monthly_rate = year_to_month_interest(get_interest_rate.to_f)
display_monthly_pay(loan_amount, monthly_duration, monthly_rate)

=begin
m = p * (j / (1 - (1 + j)**(-n)))
  m = monthly payment
  p = loan amount
  j = monthly interest rate
  n = loan duration in months
=end
