# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'openfire_rest_api/version'

Gem::Specification.new do |s|
  s.name          = "postfixman"
  s.version       = Postfixman::VERSION
  s.authors       = ["Matias Hick"]
  s.email         = ["unformatt@gmail.com"]
  s.description   = "Access to Postfixman REST API"
  s.summary       = "Access to Postfixman REST API"
  s.homepage      = "https://github.com/unformattmh/postfixman"
  s.license       = "MIT"

  s.files         = Dir["LICENSE.md", "README.md", "CHANGELOG.md", "CODE_OF_CONDUCT.md", "lib/**/*"]
  s.executables   = []
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", ">= 1.3"
  s.add_development_dependency "rake"

  s.add_runtime_dependency "rest-client", ">= 1.6.7"
end
