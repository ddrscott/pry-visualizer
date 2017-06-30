# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pry/visualizer/version'

Gem::Specification.new do |spec|
  spec.name          = 'pry-visualizer'
  spec.version       = Pry::Visualizer::VERSION
  spec.authors       = ['Scott Pierce']
  spec.email         = ['ddrscott@gmail.com']

  spec.summary       = 'Visualize results of pry commands to a website.'
  spec.homepage      = 'https://github.com/ddrscott/pry-visualizer'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'pry'
  spec.add_dependency 'rack'
  spec.add_dependency 'puma'
  spec.add_dependency 'tubesock'
end
