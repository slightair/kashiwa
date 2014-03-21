require 'sinatra'

use Rack::Static, urls: %w(/css /resources /js /lib), root: 'public'

get '/' do
  haml :index
end
