module JsonRander
  # all values types
  TYPE = ["JsonRander::JHash",
           "JsonRander::JArray",
           "JsonRander::JString",
           "JsonRander::JNum",
           "JsonRander::JSpecialValue"]

  class Configuration
    attr_accessor :string_max_length, :array_max_length, :hash_max_length
    def initialize
      @string_max_length = 5
      @array_max_length  = 5
      @hash_max_length   = 5
    end
  end
end
