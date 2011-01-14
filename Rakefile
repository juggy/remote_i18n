require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "remote_i18n/version"

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "remote_i18n"
  gem.homepage = "http://github.com/juggy/remote_i18n"
  gem.license = "MIT"
  gem.summary = %Q{I18n for Javascript with Rails}
  gem.description = %Q{RemoteI18n helps developer export translated messages from a Rails server to a Javascript/HTML client application. More and more we need to use templates in javascript to create new HTML segments, but when you are building an I18n application you need to make sure that those segments contains the right language. This is what this project is for. For now it bundle the Rails translations into different javascript file ready for consumption.}
  gem.version = RemoteI18n::Version::STRING
  gem.email = "julien@porkepic.com"
  gem.authors = ["Julien Guimont"]
end
Jeweler::RubygemsDotOrgTasks.new
