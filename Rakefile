require 'cutest'

desc 'Run all the test =)'
task :test do
  Cutest.run Dir['test/*.rb']
end

HOST='www.cirope.com'
USER='deployer'
APP_DIR='/var/rack/cirope-site'
REPO='https://github.com/cirope/cirope-site.git'

require 'net/ssh'

desc "Creates the initial directory and clones the app's repository"
task :prepare_deploy do
  Net::SSH.start(HOST, USER) do |ssh|
    out =  ssh.exec!("mkdir -p #{APP_DIR}").to_s
    out << ssh.exec!("cd #{APP_DIR} && git clone #{REPO} current").to_s

    puts out
  end
end

desc 'Updates the app to the last commit in the master branch'
task :deploy do
  Net::SSH.start(HOST, USER) do |ssh|
    commands = [
      "cd #{APP_DIR}/current",
      'git pull origin master',
      'bundle install --without development test',
      'touch tmp/restart.txt'
    ]

    puts ssh.exec!(commands.join(' && ')).to_s
  end
end

task default: :test
