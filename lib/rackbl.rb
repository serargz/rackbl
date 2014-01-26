require 'erb'
require 'yaml'
require 'articles_controller'

module Rackbl

  class Server
    def call(env)
      req = Rack::Request.new(env)
      file_path = parse(req.path)
      
      if File.exists? file_path

        article = YAML.load_file file_path
        posts = ArticlesController.new(article["title"], article["body"])

        template_file = "templates/default/article.html.erb"
        template = ERB.new File.read(template_file)
        output = template.result(posts.get_binding)

        [200, {"Content-Type" => "text/html"}, [output]]
      else
        [400, {"Content-Type" => "text/html"}, ["Oops, are you lost? Try going <a href='/2014/01/23/rackbl-tiny-rack-based-blog-engine'>here</a>"]]
      end
    end

    def parse(path)
      path = path.split("/")
      if path.size > 1
        filename = path[1,path.size].join("-") + ".yml"
        file_path = "articles/#{filename}"
      else
        file_path = ""
      end
    end

  end
end