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

# main loop
system 'clear'
prompt(MESSAGES[:welcome])
get_loan_amount
get_loan_duration
