$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "remote_i18n/version"
 
task :build do
  system "gem build remote_i18n.gemspec"
end
 
task :release => :build do
  system "gem push remote_i18n-#{RemoteI18n::Version::STRING}"
end