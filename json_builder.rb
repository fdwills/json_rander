require File.dirname(__FILE__) + '/json_num_builder'

module JsonBuilder

  # all values types
  $TYPE = ["JsonBuilder::JObject",
           "JsonBuilder::JArray",
           "JsonBuilder::JString",
           "JsonBuilder::JNum",
           "JsonBuilder::JSpecialValue"]

  # max length of random string/array/hash
  $MAX_RANDOM_LENGTH = 5

  # json object: { xx : xx, yy :: yy}
  class JObject
    def initialize
      @pairs = []

      # add random json key/value pairs to json object
      pair_num = Random.rand($MAX_RANDOM_LENGTH)
      pair_num.times { self.add_random }
    end

    # get random key: string only
    def rand_key
      return JString.new
    end

    # get random value: string/num/hash/array
    def rand_value
      return Kernel.const_get($TYPE.sample).new
    end

    def add_random
      @pairs << [rand_key, rand_value]
      return self
    end

    # to json string
    def to_s
      key_value_strs = []
      @pairs.each { | key, value | key_value_strs << "#{key.to_s} : #{value.to_s}" }
      return "{ " + key_value_strs.join(", ") + " }"
    end
  end

  # json array: [ xx, yy, zz]
  class JArray
    def initialize
      @arrs = []

      # add random json key/value pairs to json object
      element_num = Random.rand($MAX_RANDOM_LENGTH)
      element_num.times { self.add_random }
    end

    def add_random
      @arrs << Kernel.const_get($TYPE.sample).new
      return self
    end

    # to json string
    def to_s
      strs = []
      @arrs.each { |value| strs << value.to_s}
      return "[ " + strs.join(", ") + " ]"
    end
  end

  # json string: 0..9a..zA..z\n\r\t\b\f etc
  class JString
    @@chars = ("a".."z").to_a +
              ("A".."Z").to_a +
              ("0".."9").to_a +
              ["\\\\", "\\\"", "\\/", "\\n", "\\t", "\\b", "\\f", "\\r"].to_a

    def initialize
      @string = ""

      # get random string with max length limited
      string_length = Random.rand($MAX_RANDOM_LENGTH)
      string_length.times { @string << @@chars.sample }
    end

    # to json string
    def to_s
      return '"' + @string + '"'
    end
  end

  # json special value: true/false/nil
  class JSpecialValue
    @@values = [true, false, nil]
    def initialize
      @value = @@values.sample
    end

    def to_s
      case @value
      when true
        return 'true'
      when false
        return 'false'
      when nil
        return 'null'
      end
    end
  end

  # json num: build from JNumBuilder
  class JNum
    @@builder = nil
    def initialize
      if @@builder.nil?
        @@builder = JNumBuilder.new
      end
    end

    def to_s
      return @@builder.get_num.to_s
    end
  end

  # correct json format builer
  class JBuilder
    def self.get_random
      # object({ xx : yy}) or array[xx, yy]
      case  Random.rand(2)
      when 0
        return JObject.new
      when 1
        return JArray.new
      end
    end
  end

end #module
