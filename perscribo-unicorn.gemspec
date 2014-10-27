# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'perscribo/unicorn/version'

Gem::Specification.new do |s|
  s.name          = 'perscribo-unicorn'
  s.version       = Perscribo::Unicorn::VERSION
  s.authors       = ['Adam Eberlin']
  s.email         = ['ae@adameberlin.com']
  s.summary       = 'Perscribo support for Unicorn.'
  s.description   = s.summary
  s.homepage      = 'https://github.com/arkbot/perscribo-unicorn'
  s.license       = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(features|spec|test)/})
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.0.0'

  s.add_development_dependency 'bundler', '~> 1.7'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-cucumber'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-rubocop'
  s.add_development_dependency 'guard-shell'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'terminal-notifier-guard'

  s.add_dependency 'activesupport'
  s.add_dependency 'unicorn', '~> 4.8.3'

  # s.add_optional_dependency 'rails', '~> 4.1.6'
  # s.add_optional_dependency 'unicorn-rails', '~> 2.2.0'

  s.add_runtime_dependency 'perscribo'
end
