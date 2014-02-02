module JsonRander

  # json object: { xx : xx, yy :: yy}
  class JHash
    def initialize
      @pairs = []

      # add random json key/value pairs to json object
      pair_num = Random.rand(JsonRander::configuration.hash_max_length)
      pair_num.times { self.add_random }
    end

    # get random key: string only
    def rand_key
      return JString.new
    end

    # get random value: string/num/hash/array
    def rand_value
      return Kernel.const_get(JsonRander.random_type).new
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
end
