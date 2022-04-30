
require 'readline'
require 'bigdecimal'

def process_input(input, num_list, total)
  exit if input == "q"

  begin
    args = input.split(" ")
    args.each_with_index do |arg, index|
      num = is_number?(arg)
      if num
        num_list << num
        print_output(num) if args.length == 1
      else
        total = process_operator(arg, num_list, total) 
        num_list << total if total
        print_output(total) if total && index == args.length - 1
      end      
    end
  rescue Exception => e
    puts e
    num_list = []
    total = 0
    puts "An error occurred, please try again..."
  end  
end

# Checks if arg is a number. Returns the number or false if not a number
def is_number?(arg)
  Float(arg) rescue return false
  (Integer(arg) rescue false) ? arg.to_i : BigDecimal(arg)
end 

def process_operator(arg, num_list, total)
  top1 = num_list.pop
  top2 = num_list.pop
  case arg
  when "ac"
    num_list = []
    total = 0
    puts "Clearing accumulator..."        
  when "+"
    total = top2 + top1
  when "-"
    total = top2 - top1
  when "*"
    total = top2 * top1
  when "/"
    total = top1 == 0 ? not_allowed_msg : (BigDecimal(top2) / BigDecimal(top1))
  else
    not_allowed_msg
  end
  return total
end

def not_allowed_msg
  puts "Operation not allowed"
end

def print_output(arg)
  puts (arg.is_a?(Integer) ? arg : arg.to_s('F'))
end

num_list = []
total = 0
while input = Readline.readline("> ", true)
  process_input(input, num_list, total) if input.length > 0
end

