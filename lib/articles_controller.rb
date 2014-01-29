require 'articles_helper'

module Rackbl

  class ArticlesController

    include ArticlesHelper

    def initialize(article)
      @article = article
    end

    def render

      article = YAML.load_file "articles/#{@article}.yml"
      body = article["body"]

      @title = article["title"]
      @body = ERB.new(body).result(binding)

      template = ERB.new File.read("themes/default/article.html.erb")
      page = template.result(binding)
    end

    def exists?
      File.exists? "articles/#{@article}.yml"
    end
  end
  
end