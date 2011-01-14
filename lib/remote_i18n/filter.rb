module RemoteI18n
  class Filter

    def initialize(app)
      @app = app
    end

    def call(env)
      dup._call(env)
    end

    def _call(env)
      RemoteI18n.debug 'Compiling all translations'
      RemoteI18n.compile_all!
      @app.call env
    end

  end
end