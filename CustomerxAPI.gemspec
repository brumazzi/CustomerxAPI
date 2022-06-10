lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'CustomerxAPI'

Gem::Specification.new do |spec|
  spec.name                   = 'CustomerxAPI'
  spec.version                = CustomerxAPI::full_version
  spec.platform               = Gem::Platform::RUBY
  spec.authors                = ['']
  spec.email                  = ['']
  spec.summary                = 'CustomerX - Bussines management'
  spec.description            = 'Gem to integrate CustomerX platform'
  spec.homepage               = 'https://github.com/brumazzi/CustomerxAPI'
  spec.license                = 'MIT'

  spec.files                  = `git ls-files`.split($/)
  spec.executables            = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files             = spec.files.grep(%r{^(test|spec|features)/})

  spec.require_paths          = ['lib']

  spec.required_ruby_version  = Gem::Requirement.new('>= 2.7.5')

  spec.add_dependency 'json', '>= 2.3.0'
end
