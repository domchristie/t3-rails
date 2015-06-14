$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "t3/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "t3-rails"
  s.version     = T3::Rails::VERSION
  s.authors     = ["Dom Christie"]
  s.email       = ["christiedom@gmail.com"]
  s.summary     = "Use the T3 framework with Rails 4+"
  s.description = "This gem provides T3 assets for your Rails 4+ application."
  s.license     = "MIT"

  s.files = Dir["{lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "railties", "~> 4.2.1"

  s.add_development_dependency "rails", "~> 4.2.1"
end
