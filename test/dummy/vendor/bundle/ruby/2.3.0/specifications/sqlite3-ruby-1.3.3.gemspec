# -*- encoding: utf-8 -*-
# stub: sqlite3-ruby 1.3.3 ruby lib

Gem::Specification.new do |s|
  s.name = "sqlite3-ruby"
  s.version = "1.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jamis Buck", "Luis Lavena", "Aaron Patterson"]
  s.date = "2011-01-16"
  s.description = "This module allows Ruby programs to interface with the SQLite3\ndatabase engine (http://www.sqlite.org).  You must have the\nSQLite engine installed in order to build this module.\n\nNote that this module is NOT compatible with SQLite 2.x."
  s.email = ["jamis@37signals.com", "luislavena@gmail.com", "aaron@tenderlovemaking.com"]
  s.executables = ["sqlite3_ruby"]
  s.extra_rdoc_files = ["Manifest.txt", "CHANGELOG.rdoc", "README.rdoc"]
  s.files = ["CHANGELOG.rdoc", "Manifest.txt", "README.rdoc", "bin/sqlite3_ruby"]
  s.homepage = "http://github.com/luislavena/sqlite3-ruby"
  s.post_install_message = "\n#######################################################\n\nHello! The sqlite3-ruby gem has changed it's name to just sqlite3.  Rather than\ninstalling `sqlite3-ruby`, you should install `sqlite3`.  Please update your\ndependencies accordingly.\n\nThanks from the Ruby sqlite3 team!\n\n<3 <3 <3 <3\n\n#######################################################\n\n"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.rubyforge_project = "sqlite3-ruby"
  s.rubygems_version = "2.5.1"
  s.summary = "This module allows Ruby programs to interface with the SQLite3 database engine (http://www.sqlite.org)"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sqlite3>, [">= 1.3.3"])
      s.add_development_dependency(%q<hoe>, [">= 2.8.0"])
    else
      s.add_dependency(%q<sqlite3>, [">= 1.3.3"])
      s.add_dependency(%q<hoe>, [">= 2.8.0"])
    end
  else
    s.add_dependency(%q<sqlite3>, [">= 1.3.3"])
    s.add_dependency(%q<hoe>, [">= 2.8.0"])
  end
end
