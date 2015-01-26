# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'return_spy/version'

Gem::Specification.new do |spec|
  spec.name          = "return_spy"
  spec.version       = ReturnSpy::VERSION
  spec.authors       = ["Alexey Fedorov"]
  spec.email         = ["waterlink000@gmail.com"]
  spec.summary       = %q{Spies all return values from functions, allows to set up expectations on them}
  spec.description   = %q{Spies all return values from functions, allows to set up expectations on them. Used majorly for debugging and code-finding.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
