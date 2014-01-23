require 'erb'
require 'yaml'

class Rackbl
  def call(env)
    req = Rack::Request.new(env)

    path = req.path.split("/")
    if path.size > 1
      filename = path[1,path.size].join("-") + ".yml"
      file_path = "articles/#{filename}"
    else
      file_path = ""
    end
    
    if File.exists? file_path

      post = YAML.load_file file_path
      puts ">>>>>>>>>> #{post.inspect}"
      posts = PostsController.new(post["title"], post["body"])

      template_file = "templates/default/article.html.erb"
      template = ERB.new File.read(template_file)
      output = template.result(posts.get_binding)
    

      [200, {"Content-Type" => "text/html"}, [output]]
    else
      [200, {"Content-Type" => "text/html"}, ["Oops, are you lost? Try going <a href='/2014/01/23/rackbl-tiny-rack-based-blog-engine'>here</a>"]]
    end
  end
end

class PostsController
  def initialize(title = "", body = "")
    @title = title
    @body = body
  end

  def get_binding
    binding
  end
end
