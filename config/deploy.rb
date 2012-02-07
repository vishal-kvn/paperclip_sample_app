set :application, "paperclip_sample_app"
set :deploy_to, "/var/www/apps/#{application}"
set :deploy_via, :copy
set :scm, :git
set :repository,  "."

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#default_run_options[:pty] = true

set :location, "ec2-107-21-87-206.compute-1.amazonaws.com"

role :web, location                          # Your HTTP server, Apache/etc
role :app, location                          # This may be the same as your `Web` server
role :db,  location, :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :user, "ubuntu"
set :use_sudo, true

ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]

# namespace :deploy do
#   desc "Restarting mod_rails with restart.txt"
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "touch #{current_path}/tmp/restart.txt"
#   end
# 
#   desc "Fix file permissions"
#   task :fix_file_permissions, :roles => [ :app, :db, :web ] do
#     sudo "chmod -R #{current_path}/releases" 
#   end 
# end

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

#ssh -i vkajjam.pem ubuntu@ec2-107-21-87-206.compute-1.amazonaws.com

#scp -i vkajjam.pem ~/.ssh/id_rsa.pub root@ec2-107-21-87-206.compute-1.amazonaws.com:/root/.ssh/authorized_keys2