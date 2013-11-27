require 'json'
require File.dirname(__FILE__) + '/json_builder'

include JsonBuilder

def json_valid?(str)
  JSON.parse(str)
  return true
rescue JSON::ParserError
  return false
end

$successed = 0
$failed = 0

for i in 1..1000 do
    j_string = JBuilder::get_random.to_j_s
    puts j_string
    if json_valid?(j_string)
      $successed += 1
      puts true
    else
      $failed += 1
      puts false
    end
end
puts "success : ", $successed, "fail : ", $failed

