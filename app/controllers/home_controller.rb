class HomeController < Sinatra::Base
  enable :sessions
  set :session_secret, 'make session'

  helpers SessionHelper
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, '../views/') }

end