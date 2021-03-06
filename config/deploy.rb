set :application, 'cirope.com'
set :user, 'deployer'
set :repo_url, 'https://github.com/cirope/site.git'

set :format, :pretty
set :log_level, :info

set :deploy_to, "/var/www/#{fetch(:application)}"
set :deploy_via, :remote_cache

set :linked_dirs, %w{log}

set :rbenv_type, :user
set :rbenv_ruby, '2.5.3'

set :keep_releases, 5

namespace :deploy do
  after :publishing, :restart
  after :finishing,  :cleanup
end
