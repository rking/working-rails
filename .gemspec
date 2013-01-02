# -*- encoding: utf-8 -*-
$:.unshift './lib'
require 'working-rails/version'

Gem::Specification.new do |gem|
  gem.name          = 'working-rails'
  gem.version       = WorkingRails::VERSION
  gem.authors       = %w(☈king)
  gem.email         = %w(rking-working@sharpsaw.org)
  gem.summary       = gem.description = %q{Whoa — ☈king's Rails rig}
  gem.homepage      = 'https://github.com/rking/working-rails'
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{|f| File.basename f}
  gem.test_files    = gem.files.grep %r{^ test|spec|features/}
  gem.require_paths = ['lib']

  %w[
     working
     better_errors
  ].each do |dep| gem.add_dependency dep end
end
