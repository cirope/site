ENV['RACK_ENV'] ||= 'development'

require 'cuba'

require 'rack/protection'
Cuba.use Rack::Session::Cookie,
  key: 'cirope.com',
  secret: '04bd222a490a44b351e4bc9fc9ae0e2a572a03707a2760eaaf536aaba9cb15d74f60451e84d8b8ebf4fd138a6e363b1eedf2d5b56d430f5f570774da1c3feb8d'
Cuba.use Rack::Protection
Cuba.use Rack::Protection::RemoteReferrer

require 'cuba/render'
require 'erb'
Cuba.plugin Cuba::Render

Cuba.use Rack::Static,
  root: 'public',
  urls: ['/js', '/images', '/css']

# Require to avoid tilt autoload multi-thread problems
require 'redcarpet'
require 'sass'

Cuba.define do
  on get do
    on root do
      render 'home.html'
    end

    on 'styles', extension('css') do |file|
      res.headers['Content-Type'] = 'text/css; charset=utf-8'
      res.write render("./styles/#{file}.scss")
    end
  end
end
