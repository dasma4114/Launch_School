require 'yaml'

MESSAGES = YAML.load_file('prompts.yml')

VALID_YES_NO = %w(yes y no n)

def validate_yes_no
  answer = ''
  loop do
    prompt(MESSAGES[:retry])
    answer = gets.chomp
    if VALID_YES_NO.include?(answer)
      return answer
    else
      prompt(MESSAGES[:invalid_entry])
    end
  end
end

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
      prompt(MESSAGES[:invalid_entry])
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
      prompt(MESSAGES[:invalid_entry])
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
      prompt(MESSAGES[:invalid_entry])
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

def replay?(str)
  str.downcase.start_with?('y')
end

# main loop

loop do
  system 'clear'
  prompt(MESSAGES[:welcome])
  loan_amount = get_loan_amount.to_f
  monthly_duration = convert_loan_duration(get_loan_duration.to_f)
  monthly_rate = year_to_month_interest(get_interest_rate.to_f)
  display_monthly_pay(loan_amount, monthly_duration, monthly_rate)
  break unless replay?(validate_yes_no)
end
