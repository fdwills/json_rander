module JsonRander
  #special value: true/false/nil
  class JSpecialValue
    def initialize
      value = [true, false, nil].sample
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
end
