$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "t3_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "t3_rails"
  s.version     = T3Rails::VERSION
  s.authors     = ["Dom Christie"]
  s.email       = ["christiedom@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of T3Rails."
  s.description = "TODO: Description of T3Rails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
