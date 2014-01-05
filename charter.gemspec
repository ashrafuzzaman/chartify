$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "charter/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "charter"
  s.version     = Charter::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Charter."
  s.description = "TODO: Description of Charter."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.16"
  s.add_dependency 'gruff'
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
