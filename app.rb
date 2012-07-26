ENV['RACK_ENV'] ||= 'development'

require 'cuba'

require 'rack/protection'
Cuba.use Rack::Session::Cookie
Cuba.use Rack::Protection
Cuba.use Rack::Protection::RemoteReferrer

require 'cuba/render'
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
      res.write render(
        './content/layout.html.erb', content_file: 'home.html.erb'
      )
    end

    on 'styles', extension('css') do |file|
      res.headers['Content-Type'] = 'text/css; charset=utf-8'
      res.write render("./styles/#{file}.scss")
    end
  end
end
