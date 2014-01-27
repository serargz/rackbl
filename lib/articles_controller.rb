module Rackbl

  class ArticlesController

    def initialize(article)
      @article = article
    end

    def render

      article = YAML.load_file "articles/#{@article}.yml"
      @title = article["title"]
      @body = article["body"]

      template = ERB.new File.read("themes/default/article.html.erb")
      page = template.result(binding)
    end

    def exists?
      File.exists? "articles/#{@article}.yml"
    end
  end
  
end