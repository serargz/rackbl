require './rackbl/rackbl'

# TODO: Create config class to set the theme
theme = 'default'

use Rack::Static, :urls => ['/css', '/js', '/img', '/foundation'], root: "themes/#{theme}/assets"
use Rack::CommonLogger
use Rack::Reloader

use Rackbl::PagesMiddleware

run Rackbl::Server.new
