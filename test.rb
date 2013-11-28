require 'json'
require File.dirname(__FILE__) + '/json_builder'

include JsonBuilder

# json test function
def json_valid?(str)
  JSON.parse(str)
  return true
rescue JSON::ParserError
  return false
end


# test main
successed = 0
failed = 0

# test 10000 times(json format may be duplicate)
10000.times do
  # get random json format
  j_string = JBuilder::get_random.to_s
  puts j_string

  if json_valid?(j_string)
    successed += 1
    puts true
  else
    failed += 1
    puts false
  end
end

# print result
puts "success : ", successed, "fail : ", failed

