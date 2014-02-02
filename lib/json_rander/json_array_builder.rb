module JsonRander
  # json array: [ xx, yy, zz]
  class JArray
    def initialize
      @arrs = []

      # add random json key/value pairs to json object
      element_num = Random.rand(JsonRander::configuration.array_max_length)
      element_num.times { self.add_random }
    end

    def add_random
      @arrs << Kernel.const_get(JsonRander.random_type).new
      return self
    end

    # to json string
    def to_s
      strs = []
      @arrs.each { |value| strs << value.to_s}
      return "[ " + strs.join(", ") + " ]"
    end
  end
end
