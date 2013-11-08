set :application, 'cirope.com'
set :user, 'deployer'
set :repo_url, 'https://github.com/cirope/cirope-site.git'

set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :deploy_via, :remote_cache
set :scm, :git

set :rbenv_type, :user
set :rbenv_ruby, '2.0.0-p247'

set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :finishing, 'deploy:cleanup'
end
