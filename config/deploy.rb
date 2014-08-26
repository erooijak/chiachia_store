require 'capistrano'

set :stages, ["staging", "production"]
set :default_stage, "staging"

set :application, 'chiachia_store'                       	# application name
set :repo_url, 'git@github.com:erooijak/chiachia_store.git'   # your repo url
set :deploy_to, '/home/erooijak/chiachia.erooijak.simple-webhosting.eu'
set :user, "root"

set :scm, :git

set :branch, 'master'
set :keep_releases, 5

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :format, :pretty
set :log_level, :info
set :pty, true

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/sitemaps}

set :stage, :production
 
role :app, %w{root@213.159.6.126}
role :web, %w{root@213.159.6.126}
role :db,  %w{root@213.159.6.126}

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 16]
set :puma_workers, 0
set :puma_init_active_record, true
set :puma_preload_app, true

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

# To install Apache 2 development headers:
#    Please install it with apt-get install apache2-threaded-dev

#  * To install Apache Portable Runtime (APR) development headers:
#    Please install it with apt-get install libapr1-dev

#  * To install Apache Portable Runtime Utility (APU) development headers:
#    Please install it with apt-get install libaprutil1-dev

# Your system does not have a lot of virtual memory

# Compiling Phusion Passenger works best when you have at least 1024 MB of virtual
# memory. However your system only has 192 MB of total virtual memory (64 MB
# RAM, 128 MB swap). It is recommended that you temporarily add more swap space
# before proceeding. You can do it as follows:

#   sudo dd if=/dev/zero of=/swap bs=1M count=1024
#   sudo mkswap /swap
#   sudo swapon /swap


# If you cannot activate a swap file (e.g. because you're on OpenVZ, or if you
# don't have root privileges) then you should install Phusion Passenger through
# DEB/RPM packages. For more information, please refer to the manual, section
# "Installation":

#   /usr/local/rvm/gems/ruby-2.1.2/gems/passenger-4.0.49/doc/Users guide Apache.html
#   https://www.phusionpassenger.com/documentation/Users%20guide%20Apache.html

