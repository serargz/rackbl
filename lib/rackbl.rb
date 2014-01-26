require 'erb'
require 'yaml'
require 'articles_controller'

module Rackbl

  class Server
    def call(env)
      req = Rack::Request.new(env)
      
      article = ArticlesController.new(parse(req.path))

      if article.exists?
        renderer = Rackbl::Renderer.new(article.render)
        [200, {"Content-Type" => "text/html"}, [renderer.render]]
      else
        [400, {"Content-Type" => "text/html"}, ["Oops, are you lost? Try going <a href='/2014/01/23/rackbl-tiny-rack-based-blog-engine'>here</a>"]]
      end
    end

    def parse(path)
      path = path.split("/")
      if path.size > 1
        filename = path[1,path.size].join("-")
      else
        file_path = ""
      end
    end

  end
end