lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'hako-parameterstore'
  spec.version       = '0.1.0'
  spec.authors       = ['moaikids']
  spec.email         = ['moaikids@gmail.com']

  spec.summary       = 'Provide variables from ParameterStore to hako'
  spec.description   = 'Provide variables from ParameterStore to hako'
  spec.homepage      = 'https://github.com/moaikids/hako-parameterstore'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'hako', '>= 0.2.0'
  spec.add_dependency 'aws-sdk-ssm', '>= 1.5.0'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'simplecov'
end
