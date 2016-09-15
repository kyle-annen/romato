# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'romato/version'

Gem::Specification.new do |spec|
  spec.name          = "romato"
  spec.version       = Romato::VERSION
  spec.authors       = ["Kyle Annen"]
  spec.email         = ["kyleannen@gmail.com"]

  spec.summary       = %q{Romato is an API wrapper for Zomato API v2.1.}
  spec.description   = %q{Romato provides a class, Zomato, which has methods corresponding to each API class provided under the Zomato API documentation.  Please read through the Zomato API terms of use: https://www.zomato.com/api_policy}
  spec.homepage      = "http://www.github.com/kyle-annen/romato"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org/"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "httparty"
  spec.add_runtime_dependency "bundler", "~> 1.13"
  spec.add_runtime_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "rspec", "~> 3.0"

  spec.add_development_dependency "httparty"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"  
end
