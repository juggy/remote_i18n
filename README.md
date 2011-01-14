# RemoteI18n #

RemoteI18n helps developer export translated messages from a Rails server to a Javascript/HTML client application. More and more we need to use templates in javascript to create new HTML segments, but when you are building an I18n application you need to make sure that those segments contains the right language. This is what this project is for. For now it bundle the Rails translations into different javascript file ready for consumption.

## Getting started
*For Rails 3 only*

1. Add `gem 'remote_i18n' to your Gemfile
2. Run `bundle install`
3. Create a "remote_i18n" in /config/initializers 

Add the following

    RemoteI18n.configure do |config|
      config.translate :name=>:date, :i18n_path=>"date", :only=>["en", "fr-CA"]
      config.translate :name=>:errors, :i18n_path=>"errors", :only=>["en", "fr-CA"]
    end

The configuration can't be simpler
-  _name_ is the name of the resulting file in /public/javascripts
-  _i18n_path_ is the path to use in the Rails i18n module
-  _only_ is to specify languages, by default it is all configured ones
 
The output of this configuration would be:

    - /public/javascripts/date.en.js
    - /public/javascripts/date.fr-CA.js
    - /public/javascripts/errors.en.js
    - /public/javascripts/errors.fr-CA.js
   
In Javascript the _T_ object is created to access the translations:

    blank_error = T.errors.message.blank;
    january = T.date.month_names[1];

## More Details

In development and in test, a rack middleware is loaded and compiles the changes to the translations at each requests. This cannot be done in production, so there is a bundled rake task to generate the javascript files for deployment:

    rake remote_i18n:compile
    
I use Jammit to organize my javascript files. I create a Jammit package for each language and use the locale to include it on the page:

    include_javascripts "translations_#{I18n.locale}"

## Copyright ##
Most of the code is heavily inspired by excellent Barista from Darcy Laycock.

Copyright (c) 2010 Julien Guimont. See LICENSE for details.
Copyright (c) 2010 Darcy Laycock. See LICENSE for details.