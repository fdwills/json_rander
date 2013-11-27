require 'json'

def json_valid?(str)
  JSON.parse(str)
  return true
rescue JSON::ParserError
  return false
end

$successed = 0
$failed = 0

open("json.txt") do |io|
  io.readlines.each { |line|
    unless line.include?("\#") or line.eql?("\n")
      (value, str) = line.split('|')
      value.chomp!
      test_value = value.eql?("true") ? true : false
      unless json_valid?(str).eql?(test_value)
        $failed += 1
        puts value, str
        puts json_valid?(str)
      else
        $successed += 1
      end
    end
  }
end
puts "success : ", $successed, "fail : ", $failed

