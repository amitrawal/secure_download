# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'secure_download/version'

Gem::Specification.new do |spec|
  spec.name          = "secure_download"
  spec.version       = SecureDownload::VERSION
  spec.authors       = ["Amit Rawal"]
  spec.email         = ["amit.rawal@in.v2solutions.com"]
  spec.description   = %q{Generate secure urls by adding token and timestamps which expire after a while.}
  spec.summary       = %q{Generate secure urls by adding token and timestamps which expire after a while.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
