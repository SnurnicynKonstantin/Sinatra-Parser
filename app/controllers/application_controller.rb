class ApplicationController < HomeController

  get '/' do
    puts "Session: #{session[:remember_token]}"
    slim :'application/index'
  end

  get '/login' do
    slim :'application/login'
  end

  get '/logout' do
    sign_out
    slim :'application/index'
  end

  not_found do
    slim :'application/login'
  end
end