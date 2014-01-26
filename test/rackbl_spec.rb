# rackbl_spec.rb
$:.unshift("../lib")
require 'rack/test'
require 'articles_controller'
require 'pages_controller'

describe Rackbl::ArticlesController, "#" do
  include Rack::Test::Methods
  it "returns true" do
    1.should eq(1)
  end
end

describe Rackbl::PagesController, "#index" do
  it "should show index view" do
    pc = Rackbl::PagesController.new
    pc.index.should eq("Index test")
  end
end