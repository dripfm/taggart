# Loads mkmf which is used to make makefiles for Ruby extensions
require 'mkmf'
extension_name = 'taggart_base'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))

taglib_config = find_executable("taglib-config")
if taglib_config
  TAGLIB_FLAGS = `taglib-config --cflags --libs`.strip
  $CPPFLAGS= "#{$CPPFLAGS} #{TAGLIB_FLAGS}"
else
  dir_config('taglib')
end

# The destination
dir_config(extension_name)
have_library('tag')
$CPPFLAGS = "#{$CPPFLAGS} -fpermissive"

# Do the work
create_makefile(extension_name)
