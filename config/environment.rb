require 'bundler/setup'
Bundler.require(:default)
require 'carrierwave/orm/activerecord'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/posts.sqlite3'
)

require_all 'app'
