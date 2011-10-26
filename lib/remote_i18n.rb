require 'i18n'

module RemoteI18n
  autoload :Integration, 'remote_i18n/integration'
  autoload :Filter,      'remote_i18n/filter'
  
  class << self
    
    def configure
      yield self if block_given?
    end
    
    def library_root
      @library_root ||= Pathname(__FILE__).dirname
    end
    
    def default_for_add_filter
      local_env?
    end
    
    def local_env?
      %w(test development).include? RemoteI18n.env
    end
    
    def env
      @env ||= default_for_env
    end

    def env=(value)
      @env = value.to_s.strip
      @env = nil if @env == ''
    end
    
    def default_for_env
      return Rails.env.to_s if defined?(Rails.env)
      ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'development'
    end
    
    def add_filter?
      local_env?
    end
    
    def default_for_logger
      if defined?(Rails.logger)
        Rails.logger
      else
        require 'logger'
        Logger.new(STDOUT)
      end
    end
    
    def logger
      @logger ||= default_for_logger
    end

    def logger=(value)
      @logger = value
    end
    
    def debug(message)
      logger.debug "[RemoteI18n] #{message}"
    end
    
    def app_root
      @app_root ||= default_for_app_root
    end

    def app_root=(value)
      @app_root = value.nil? ? nil : Pathname(value.to_s)
    end
    
    def output_root
      @output_root ||= app_root.join("public", "javascripts")
    end

    def output_root=(value)
      @output_root = value.nil? ? nil : Pathname(value.to_s)
    end
    
    def default_for_app_root
      if defined?(Rails.root)
        Rails.root
      else
        Pathname(Dir.pwd)
      end
    end
    
    def translate(opts)
      translations << opts
    end
    
    def translations
      @translations ||= []
    end
    
    def compile_all!
      I18n.backend.send("init_translations")
      languages = I18n.backend.send("translations")
      default_locale = I18n.locale
      languages.each_key do |locale|
        I18n.locale = locale
        translations.each do |t|
          name = t[:name]
          i18n_path = t[:i18n_path]
          only = t[:only]
          
          next if !(only.include? locale.to_s)
          
          output = I18n.translate(i18n_path)
          path = output_root.join("#{name}.#{locale}.js")
          
          compiled_output = "if(this.T === null || this.T == undefined)this.T = {};this.T.#{name} = #{output.to_json};"
          
          FileUtils.mkdir_p File.dirname(path)
          File.open(path, "w+") { |f| f.write compiled_output }
        end
      end
      I18n.locale = default_locale
    end
    
  end
  
  # Setup integration by default.
  Integration.setup
  
end
