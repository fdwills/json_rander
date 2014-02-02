module JsonRander
  # json string: 0..9a..zA..z\n\r\t\b\f etc
  class JString
    def initialize
      chars = ("a".."z").to_a +
              ("A".."Z").to_a +
              ("0".."9").to_a +
              ["\\\\", "\\\"", "\\/", "\\n", "\\t", "\\b", "\\f", "\\r"].to_a

      unicode_chars = ("0".."9").to_a +
                      ("a".."f").to_a +
                      ("A".."F").to_a

      @string = ""

      # get random string with max length limited
      string_length = Random.rand(JsonRander::configuration.string_max_length)
      string_length.times do
        case Random.rand(2)
        when 0
          # num/alp
          @string << chars.sample
        when 1
          # unicode
          @string << "\\u"
          4.times { @string << unicode_chars.sample}
        end
      end
    end

    # to json string
    def to_s
      return '"' + @string + '"'
    end
  end
end
