require 'pages_controller'

module Rackbl
  class PagesMiddleware

    def initialize(app)
      @app = app
    end

    def call(env)
      req = Rack::Request.new(env)
      action = req.path == "/" ? "index" : req.path[1, req.path.length]
      if is_page?(action)
        pages_controller = PagesController.new
        output = pages_controller.send action
        if output
          [200, {"Content-Type" => "text/html"}, [output]]
        else
          [400, {"Content-Type" => "text/html"}, ["Oops, are you lost?"]]
        end
      else
        @app.call(env)
      end
    end

    # Check if exists a page for the requested resource
    def is_page?(action)
      d = Dir.new "pages"
      d.each do |f|
        if f[0] != '.'
          # TODO: Allow different kind of extensions
          return true if action == File.basename(f, ".html.erb")
        end
      end
      false
    end

  end
end
