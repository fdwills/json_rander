require 'json_rander/json_num_builder'
require 'json_rander/json_array_builder'
require 'json_rander/json_hash_builder'
require 'json_rander/json_string_builder'
require 'json_rander/json_special_builder'
require 'json_rander/configuration'

module JsonRander

  # set configuration
  def self.configuration
    @configuration ||= Configuration.new
  end

  # get random type
  def self.random_type
    TYPE.sample
  end

  # correct json format builer
  def self.get_random
    # object({ xx : yy}) or array[xx, yy]
    case  Random.rand(2)
    when 0
      return JHash.new
    when 1
      return JArray.new
    end
  end
end #module
