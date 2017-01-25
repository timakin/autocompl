$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "autocompl/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "autocompl"
  s.version     = Autocompl::VERSION
  s.authors     = ["timakin"]
  s.email       = ["seiji.takahashi@translimit.co.jp"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Autocompl."
  s.description = "TODO: Description of Autocompl."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
end
