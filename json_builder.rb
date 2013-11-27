module JsonBuilder
$TYPE = ["JsonBuilder::JObject",
         "JsonBuilder::JArray",
         "JsonBuilder::JString",
         "JsonBuilder::JNum",
         "JsonBuilder::JSpecialValue"]
$TYPE_NUM          = 5
$MAX_RANDOM_LENGTH = 4
$MAX_RANDOM        = 300

class JObject
  def initialize
    @pairs = []
    times = Random.rand($MAX_RANDOM_LENGTH)
    for i in 1..times do
      self.add_random
    end
  end

  def rand_valid_key
    return JString.new
  end

  def rand_valid_value
    type_no = Random.rand($TYPE_NUM)
    return Kernel.const_get($TYPE[type_no]).new
  end

  def add_random
    @pairs << [rand_valid_key, rand_valid_value]
    return self
  end

  # to json string
  def to_j_s
    key_value_strs = []
    @pairs.each { | key, value | key_value_strs << "#{key.to_j_s} : #{value.to_j_s}" }
    return "{ " + key_value_strs.join(", ") + " }"
  end
end

class JArray
  def initialize
    @arrs = []
    times = Random.rand($MAX_RANDOM_LENGTH)
    for i in 1..times do
      self.add_random
    end
  end

  def add_random
    type_no = Random.rand($TYPE_NUM)
    @arrs << Kernel.const_get($TYPE[type_no]).new
    return self
  end

  def to_j_s
    strs = []
    @arrs.each { |value| strs << value.to_j_s}
    return "[ " + strs.join(", ") + " ]"
  end
end

class JString
  @@chars = ("a".."z").to_a +
            ("A".."Z").to_a + ("0".."9").to_a +
            ["\\\\", "\\\"", "\\/", "\\n", "\\t", "\\b", "\\f", "\\r"].to_a

  def initialize
    @string = ""
    1.upto($MAX_RANDOM_LENGTH) { |i| @string << @@chars[Random.rand(@@chars.size-1)] }
  end

  def to_j_s
    return '"' + @string + '"'
  end
end

class JSpecialValue
  def initialize
    times = Random.rand(3)
    case times
    when 0
      @value = nil
    when 1
      @value = true
    when 2
      @value = false
    end
  end

  def to_j_s
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


class JNum
  def initialize
    @value = Random.rand($MAX_RANDOM)
  end

  def to_j_s
    return @value
  end
end

class JBuilder
  def self.get_random
    case  Random.rand(2)
    when 0
      return JObject.new
    when 1
      return JArray.new
    end
  end
end
end #module
