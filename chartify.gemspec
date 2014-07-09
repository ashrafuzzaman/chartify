$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "chartify/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "chartify"
  s.version = Chartify::VERSION
  s.authors = ["A.K.M. Ashrafuzzaman"]
  s.email = ["ashrafuzzaman.g2@gmail.com"]
  s.homepage = "https://github.com/ashrafuzzaman/chartify"
  s.summary = "A gem to manage charts in the web and to make it exportable in image from ruby code."
  s.description = %q{This gem wraps the data to render chart and then it draws those charts in the web
                      and use the same data to render charts as images, which is often useful when you want to render the chart
                      in pdf or attach it to emails}
  s.license = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'gruff', '~> 0.5'

  s.add_development_dependency 'railties', ['>= 3', '< 5']
  s.add_development_dependency "sqlite3", '~> 0'
  s.add_development_dependency 'rake', ['~> 10.3']
  s.add_development_dependency 'rspec', ['~> 3']
  s.add_development_dependency 'rspec-mocks', '~> 3'
  s.add_development_dependency "activerecord", '~> 4'
  s.add_development_dependency "activesupport", '~> 4'
  s.add_development_dependency 'database_cleaner', ['~> 1.2']
end
