namespace :remote_i18n do

  desc "Compiles translations to javascripts into public/javascripts"
  task :compile => :environment do
    RemoteI18n.compile_all!
  end
  
end