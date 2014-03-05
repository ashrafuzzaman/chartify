$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "charter/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "charter"
  s.version     = Charter::VERSION
  s.authors     = ["A.K.M. Ashrafuzzaman"]
  s.email       = ["ashrafuzzaman.g2@gmail.com"]
  s.homepage    = "https://github.com/ashrafuzzaman/charter"
  s.summary     = "A gem to manage online chart so that it can be exportable in image from ruby code."
  s.description = "A gem to manage online chart so that it can be exportable in image from ruby code."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  #s.add_dependency "rails", ">= 3.2.16"
  s.add_dependency 'gruff', '~> 0.5.1'
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end