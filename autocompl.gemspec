$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'autocompl/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'autocompl'
  s.version     = Autocompl::VERSION
  s.authors     = ['timakin']
  s.email       = ['timaki.st@gmail.com']
  s.homepage    = 'https://github.com/timakin/autocompl'
  s.summary     = 'Autocompl is a light-weight autocomplete integration for Rails.'
  s.description = 'Autocompl is a light-weight autocomplete integration for Rails, that depends on just only vanilla javascript.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_runtime_dependency 'rails', '~> 4.2', '>= 4.2.6'

  s.add_development_dependency 'sqlite3', '~> 1.3', '>= 1.3.13'
end
