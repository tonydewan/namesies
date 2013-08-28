# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'namesies/version'

Gem::Specification.new do |spec|
  spec.name          = "namesies"
  spec.version       = Namesies::VERSION
  spec.authors       = ["Tony Dewan"]
  spec.email         = ["tony.dewan@gmail.com"]
  spec.description   = "Naming things is hard. Namesies make's it a little easier."
  spec.summary       = "Search ALL THE THINGS when trying to name things."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = [
    "lib/namesies.rb",
    "lib/namesies/version.rb",
    "lib/namesies/cli.rb"
  ]
  spec.executables   = ["namesies"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
