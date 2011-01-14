# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{remote_i18n}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Julien Guimont"]
  s.date = %q{2011-01-14}
  s.description = %q{RemoteI18n helps developer export translated messages from a Rails server to a Javascript/HTML client application. More and more we need to use templates in javascript to create new HTML segments, but when you are building an I18n application you need to make sure that those segments contains the right language. This is what this project is for. For now it bundle the Rails translations into different javascript file ready for consumption.}
  s.email = %q{julien@porkepic.com}
  s.extra_rdoc_files = [
    "LICENSE.md",
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.md",
    "README.md",
    "Rakefile",
    "lib/remote_i18n.rb",
    "lib/remote_i18n/filter.rb",
    "lib/remote_i18n/integration.rb",
    "lib/remote_i18n/integration/rails3.rb",
    "lib/remote_i18n/tasks/remote_i18n.rake",
    "lib/remote_i18n/version.rb",
    "remote_i18n.gemspec"
  ]
  s.homepage = %q{http://github.com/juggy/remote_i18n}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{I18n for Javascript with Rails}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
  end
end

