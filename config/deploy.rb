require 'bundler/capistrano'
require 'rvm/capistrano'

load 'deploy/assets'

# Mogelijk trucjes
ssh_options[:forward_agent] = true
#set :linked_dirs, %w(public/spree)

#Trucje twee voor DB
set :normalize_asset_timestamps, false

# De naam van uw chiachiastore
set :application, "chiachiastore"

# Gegevens van de Bluerail server
set :host, "mushu.bluerail.nl"
set :user, "chiachia"

# Versiebeheer instellingen
set :scm, :git  # Of 'subversion', 'mercurial' , etc.
set :repository,  "https://github.com/erooijak/chiachia_store"

# Gebruik de standaard Ruby van de server
set :rvm_ruby_string, 'default'

# De onderstaande instellingen zijn specifiek voor de Bluerail servers, u
# hoeft hier zelf geen wijzigingen in aan te brengen.
set :deploy_to, lambda { capture("echo -n ~/rails") }
set :rvm_type, :system
set :rvm_bin_path, '/usr/local/rvm/bin'
set :use_sudo, false
set :keep_releases, 5
after "deploy:update", "deploy:cleanup"

# Bij rvm-capistrano v1.3.0 of hoger dient de volgende regel toegevoegd te worden.
set :rvm_path, '/usr/local/rvm'

role :web, host
role :app, host
role :db,  host, :primary => true

# Taak voor het herstarten van de Passenger chiachiastore en symlinken van de database.yml
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :symlink_shared do
  	 run "ln -nfs #{shared_path}/shared/spree/ #{release_path}/public/spree/""
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  after "deploy:update_code", :link_production_db
end

desc "Link database.yml from shared path"
task :link_production_db do
  run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
end

