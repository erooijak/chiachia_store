source 'https://rubygems.org'
gem 'rails', '4.0.5'
ruby '1.9.3'
gem 'thin'
group :production do
gem 'pg'
gem 'rails_12factor'
end

group :development do
  gem 'capistrano', '~> 3.1.0'
  gem 'capistrano-rvm'
  # cap tasks to manage puma application server
  gem 'capistrano-puma'
  gem 'capistrano-rails',   '~> 1.1'
  gem 'capistrano-bundler', '~> 1.1'
end
#gem 'spree_product_translations'
group :assets do
gem 'sass-rails', '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem 'spree', github: 'spree/spree', branch: '2-1-stable'
gem 'spree_i18n', github: 'spree/spree_i18n', :branch => '2-1-stable'
gem 'spree_gateway', :git => 'https://github.com/spree/spree_gateway.git', :branch => '2-1-stable'
gem 'spree_auth_devise', :git => 'https://github.com/spree/spree_auth_devise.git', :branch => '2-1-stable'
#Trying to fix the nomethod error in order controller
gem 'devise-encryptable'
# SpreeI18n::Config.available_locales = [:en, :'nl-NL']
# SpreeI18n::Config.supported_locales = [:en, :'nl-NL']
gem 'spree_bootstrap_frontend', github: '200Creative/spree_bootstrap_frontend', branch: '2-1-stable'