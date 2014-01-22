set :stage, :production
set :rails_env, 'production'

role :app, %w{deployer@cirope.com}
role :web, %w{deployer@cirope.com}
role :db,  %w{deployer@cirope.com}

server 'cirope.com', user: 'deployer', roles: %w{web app db}
