require 'json'

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

# load test file
# file format: expected_result| json_format
# #comment
# [true|false]| json_format
#
open("json.txt") do |io|
  io.readlines.each do |line|

    # skip illegal lines
    unless line.nil? or line =~ /^[#\n]/ or (line =~ /^(true|false)/) == nil
      # spilt expected result and jsonformat
      (value, str) = line.split('|')
      value.chomp!

      # test
      test_value = value.eql?("true") ? true : false
      unless json_valid?(str).eql?(test_value)
        failed += 1
        puts value, str
        puts json_valid?(str)
      else
        successed += 1
      end
    end
  end
end

# print result
puts "success : ", successed, "fail : ", failed

