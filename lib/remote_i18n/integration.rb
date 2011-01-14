module RemoteI18n
  module Integration
    
    autoload :Rails3,  'remote_i18n/integration/rails3'
    
    def self.setup
      setup_rails   if defined?(Rails)
      setup_sinatra if defined?(::Sinatra)
    end
    
    def self.setup_rails
      case Rails::VERSION::MAJOR
      when 3
        Rails3
      when 2
        throw "Not supported yet"
      end
    end
    
    def self.setup_sinatra
      throw "Not supported yet"
    end
    
  end
end