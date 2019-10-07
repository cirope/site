ENV['RACK_ENV'] ||= 'development'

require 'cuba'

require 'rack/protection'
Cuba.use Rack::Session::Cookie,
  key: 'cirope.com',
  secret: ENV['COOKIE_SECRET']
Cuba.use Rack::Protection
Cuba.use Rack::Protection::RemoteReferrer

require 'cuba/render'
Cuba.plugin Cuba::Render

Cuba.use Rack::Static,
  root: 'public',
  urls: ['/js', '/images', '/css']

Cuba.define do
  on get do
    on root do
      render 'home.html'
    end
  end
end
