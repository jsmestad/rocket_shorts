# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rocket_shorts/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Justin Smestad"]
  gem.email         = ["justin.smestad@gmail.com"]
  gem.description   = %q{Because RocketPants needs another clothing option.}
  gem.summary       = %q{Because RocketPants needs another clothing option.}
  gem.homepage      = "https://github.com/jsmestad/rocket_shorts"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rocket_shorts"
  gem.require_paths = ["lib"]
  gem.version       = RocketShorts::VERSION

  if File.exists?('UPGRADING')
    s.post_install_message = File.read("UPGRADING")
  end

  gem.add_dependency 'rocket_pants', '~> 1.5.3'

  gem.add_development_dependency 'appraisal'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec-rails'
  gem.add_development_dependency 'yard'
end
