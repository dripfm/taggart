$LOAD_PATH.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "taggart"
  s.version     = '0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Cole Brown", "Artem Titoulenko"]
  s.email       = ["cole@drip.fm"]
  # s.homepage    = "http://github.com/carlhuda/newgem"
  s.summary     = "Ultra-thin wrapper over TagLib's metadata-embedding functionality."
  s.description = "This isn't going to hurt a bit."

  s.required_rubygems_version = ">= 1.3.6"

  s.rubyforge_project         = "taggart"

  # If you have other dependencies, add them here
  # s.add_dependency "another", "~> 1.2"

  # If you need to check in files that aren't .rb files, add them here
  # s.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.files        = Dir["{lib,ext}/**/*.{rb,cxx}", "taggart.gemspec"]
  s.require_paths = ['lib']

  # If you need an executable, add it here
  # s.executables = ["newgem"]

  # If you have C extensions, uncomment this line
  s.extensions = "ext/taggart_base/extconf.rb"
end
