require 'bundler'
RACKBL_ROOT = Bundler.root.to_s
$:.unshift "#{RACKBL_ROOT}/rackbl"
ENV["RACK_ENV"] ||= "development"
Bundler.require(:default, ENV["RACK_ENV"])

require 'server'