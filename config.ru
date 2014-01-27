$:.unshift('lib')

require 'rackbl'
require 'pages_middleware'

# Rack config
use Rack::Static, :urls => ['/stylesheets', '/javascript', '/images'], root: "public"
use Rack::CommonLogger
use Rack::Reloader

use Rackbl::PagesMiddleware

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

run Rackbl::Server.new