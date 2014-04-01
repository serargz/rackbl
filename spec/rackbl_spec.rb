# rackbl_spec.rb
$:.unshift("../lib")
require 'yaml'
require 'rack/test'
require 'rspec-html-matchers'
require 'articles_controller'
require 'pages_controller'
require 'renderer'

describe Rackbl::ArticlesController, "#" do
  include Rack::Test::Methods
  it "returns false because the article doesn't exist" do
    article = Rackbl::ArticlesController.new('2013-04-02-non-existent-article')
    article.exists?.should eq(false)
  end

  it "shows test article" do
    article = Rackbl::ArticlesController.new('2013-04-02-test-post')
    yml = YAML.load_file 'articles/2013-04-02-test-post.yml'
    article.render.should have_tag('h1', text: yml['title'])
  end
end

describe Rackbl::PagesController, "#index" do
  it "shows index view" do
    pc = Rackbl::PagesController.new
    pc.index.should have_tag('div#content', text: /Index test/)
  end
end

describe Rackbl::Renderer, '#render' do
  it "shows layout" do
    renderer = Rackbl::Renderer.new("Test content")
    renderer.render.should have_tag('div#content', text: /Test content/)
  end
end