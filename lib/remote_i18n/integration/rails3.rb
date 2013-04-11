module RemoteI18n
  module Integration
    module Rails3    
      class Railtie < Rails::Railtie
        
        rake_tasks do
          load RemoteI18n.library_root.join('remote_i18n/tasks/remote_i18n.rake').to_s
        end
        
        initializer 'remote_i18n.wrap_filter' do
          #config.app_middleware.use RemoteI18n::Filter if RemoteI18n.add_filter?
        end
        
      end
    end
  end
end
