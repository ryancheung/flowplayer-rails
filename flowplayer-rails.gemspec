# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flowplayer/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "flowplayer-rails"
  spec.version       = Flowplayer::Rails::VERSION
  spec.authors       = ["ryancheung"]
  spec.email         = ["ryancheung.go@gmail.com"]
  spec.summary       = %q{Use Flowplayer with Rails 3}
  spec.description   = %q{This gem provides flowplayer flash player for your Rails 3 application.}
  spec.homepage      = "https://github.com/ryancheung/flowplayer-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "railties", ">= 3.0", "< 5.0"
  spec.add_dependency "json"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "mocha"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
