require 'bundler/capistrano'
set :application, "Insomnia"

default_run_options[:pty] = true 
set :repository,  "git@github.com:akinsgre/enki.git"

set :scm, "git"

set :user, "capistrano"
set :password, "#{ENV['PASSWORD']}"

set :scm_passphrase, "#{ENV['PASSPHRASE']}"
set :branch, "master"

role :web, "173.255.238.234"
role :app, "173.255.238.234", :primary => true
role :db,  "173.255.238.234", :primary => true

before 'deploy:update' do
  run "echo `whoami`" 
  run 'export LANG=en_US.UTF-8'
  run 'export LC_ALL=en_US.UTF-8'
end

after 'deploy:update_code' do
#     run "cp #{current_path}/config/database.example.yml #{release_path}/config/database.yml"
end

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
