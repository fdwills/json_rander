# json-rander
random json string builder

An implementation of json string [http://www.json.org/][1],
can produce json string with random hash, array, num and string(with unicode).

## install
  include in Gemfile

    gem 'json_rander'

  install by bundle

    bundle install
## usage

    require 'json_rander'
    100.times do
      puts JsonRander.get_random
    end

[1]: http://www.json.org/
