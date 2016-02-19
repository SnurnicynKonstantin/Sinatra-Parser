class SessionController < HomeController
  include SessionHelper

  post '/create' do
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
      redirect to "../user/#{user.id}"
    else
      redirect to '../' #вывод ошибки
    end
  end

  get '/destroy' do
    #sign_out
    redirect to '../'
  end
end