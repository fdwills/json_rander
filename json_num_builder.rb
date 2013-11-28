require 'singleton'

module JsonBuilder

  # nodes at num walking map
  # ref: http://www.json.org/json-ja.html
  # node base class
  class JNumNode
    # next nodes symbol
    def initialize(*nexts)
      @next_nodes = nexts
    end

    # head node?
    def is_head?
      return false
    end

    # tail node?
    def is_tail?
      return false
    end

    # randomly get next node symbol
    def random_next
       return @next_nodes.sample
    end

    # to string method
    def to_s
        return ""
    end
  end

  # node classes inhert from JNumNode
  # head node class
  class JNumHead < JNumNode
    def is_head?
      return true
    end
  end

  # tail node class
  class JNumTail < JNumNode
    def is_tail?
      return true
    end
  end

  # '-'
  class JNumMinus < JNumNode
    def to_s
      return '-'
    end
  end

  # '+'
  class JNumPlus < JNumNode
    def to_s
      return '+'
    end
  end

  # 0~9
  class JNumDigit < JNumNode
    @@nums = (0..9).to_a
    def to_s
      return "#{@@nums.sample}"
    end
  end

  # 1~9
  class JNumPositiveDigit < JNumNode
    @@nums = (1..9).to_a
    def to_s
      return "#{@@nums.sample}"
    end
  end

  # 0
  class JNumZero < JNumNode
    def to_s
      return '0'
    end
  end

  # '.'
  class JNumDot < JNumNode
    def to_s
      return '.'
    end
  end

  # 'E'
  class JNumBigE < JNumNode
    def to_s
      return 'E'
    end
  end

  # 'e'
  class JNumSmallE < JNumNode
    def to_s
      return 'e'
    end
  end

  # Json Num Builder: singleton
  class JNumBuilder
    include Singleton

    def initialize
      @nodes = { n0: JNumHead.new(:n1, :n2, :n3),
                 n1: JNumMinus.new(:n2, :n3),
                 n2: JNumZero.new(:n5, :n7, :n8, :n12),
                 n3: JNumPositiveDigit.new(:n4, :n5, :n7, :n8, :n12),
                 n4: JNumDigit.new(:n3, :n4, :n5, :n7, :n8, :n12),
                 n5: JNumDot.new(:n6),
                 n6: JNumDigit.new(:n6, :n7, :n8, :n12),
                 n7: JNumBigE.new(:n9, :n10, :n11),
                 n8: JNumSmallE.new(:n9, :n10, :n11),
                 n9: JNumPlus.new(:n11),
                 n10: JNumMinus.new(:n11),
                 n11: JNumDigit.new(:n11, :n12),
                 n12: JNumTail.new
               }
    end

    # get a valid json numer
    def get_num
      num_string = ""

      # begin walking from :n0
      current_node = @nodes[:n0]

      # end walking when reaches tail
      until current_node.is_tail? do
           num_string << current_node.to_s
           current_node = @nodes[current_node.random_next]
      end

      return num_string
    end
  end

end #module
