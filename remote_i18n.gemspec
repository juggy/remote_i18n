# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'remote_i18n/version'
 
Gem::Specification.new do |s|
  s.name        = "remote_i18n"
  s.version     = RemoteI18n::Version::STRING
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Julien Guimont"]
  s.email       = ["julien@porkepic.com"]
  s.extra_rdoc_files = [
      "LICENSE.md",
      "README.md"
    ]
  s.homepage    = "http://github.com/juggy/remote_i18n"
  s.summary     = "Remotely export rails translations to a javascript file"
 
  s.required_rubygems_version = ">= 1.3.6"
 
  s.files        = Dir.glob("{lib}/**/*")
  s.require_path = 'lib'
end