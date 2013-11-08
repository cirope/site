set :stage, :production
set :rails_env, 'production'

role :all, %w{cirope.com}

server 'cirope.com', user: 'deployer', roles: %w{web app db}
