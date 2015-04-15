$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "flash_analytics/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "flash_analytics"
  s.version     = FlashAnalytics::VERSION
  s.authors     = ["fylooi"]
  s.email       = ["fy.looi+github@gmail.com"]
  s.homepage    = "http://www.github.com/fylooi/flash-analytics"
  s.summary     = "FlashAnalytics"
  s.description = "A simple way to render javascript analytics fragments on demand"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"
end
