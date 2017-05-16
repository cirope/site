set :stage, :production
set :rails_env, 'production'

role :app, %w{deployer@sites.cirope.com}
role :web, %w{deployer@sites.cirope.com}
role :db,  %w{deployer@sites.cirope.com}

server 'sites.cirope.com', user: 'deployer', roles: %w{web app db}
