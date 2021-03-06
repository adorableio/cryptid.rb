# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cryptid/version'

Gem::Specification.new do |spec|
  spec.name          = 'cryptid'
  spec.version       = Cryptid::VERSION
  spec.authors       = ['Zachery Moneypenny']
  spec.email         = ['zachery@adorable.io']

  spec.summary       = %q{Ruby client to Cryptid Analytics}
  spec.description   = %q{Log analytics events to the Cryptid Analytics service from your Ruby API}
  spec.homepage      = 'https://github.com/adorableio/cryptid.rb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'excon', '~> 0.59.0'
  spec.add_dependency 'kamelcase', '~> 0'
end
