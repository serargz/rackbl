require 'bundler'
require 'rack'
RACKBL_ROOT = Bundler.root.to_s
$:.unshift "#{RACKBL_ROOT}/rackbl"
ENV["RACK_ENV"] ||= "development"
Bundler.require(:default, ENV["RACK_ENV"])

# Put files in directories and load all.
require 'articles_controller'
require 'pages_middleware'
require 'renderer'

require 'server'
