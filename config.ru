$:.unshift('lib')

require 'rackbl'
require 'pages_middleware'

# Rack config

# TODO: Create config class to set the theme
theme = 'default'

use Rack::Static, :urls => ['/css', '/js', '/img', '/foundation'], root: "themes/#{theme}/assets"
use Rack::CommonLogger
use Rack::Reloader

use Rackbl::PagesMiddleware

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

run Rackbl::Server.new