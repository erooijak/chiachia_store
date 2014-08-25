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
set :log_level, :debug
set :pty, true

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

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