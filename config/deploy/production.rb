set :stage, :production
set :rails_env, 'production'

role :app, %w{deployer@web.cirope.com}
role :web, %w{deployer@web.cirope.com}
role :db,  %w{deployer@web.cirope.com}

server 'web.cirope.com', user: 'deployer', roles: %w{web app db}
