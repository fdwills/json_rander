# -*- encoding: utf-8 -*-
lib = File.expand_path(File.join(File.dirname(__FILE__),'lib/'))
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'json_rander/version'

Gem::Specification.new do |s|
  s.name        = 'json_rander'
  s.version     = JsonRander::VERSION
  s.date        = '2014-01-28'
  s.summary     = "generate random json string"
  s.description = "generate random json string"
  s.authors     = ["wills"]
  s.email       = 'weirenzhong@gmail.com'
  s.files       = `git ls-files`.split($/)
  s.homepage    = 'https://github.com/fdwills/json_rander'
  s.license     = 'MIT'
end
