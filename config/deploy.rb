# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'Blog'
set :repo_url, 'https://github.com/ChengHsuanLiu/blog.git'
set :scm,             :git
set :user,            'deploy'
set :pty,             false
set :use_sudo,        false
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/#{fetch(:application)}"
set :ssh_options,     { forward_agent: true, user: fetch(:user) }
set :rvm_type, :auto
set :rvm_ruby_version, '2.3.1'
set :bundle_jobs, 4

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs,  fetch(:linked_dirs,  []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')

set :keep_releases, 5



# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
