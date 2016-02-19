class UserController < HomeController
  get '/new' do
    @user = User.new
    slim :'user/new'
  end

  get '/:id' do
    @user = User.find(params[:id])
    if @user.admin?
      @courses = Course.all
    else
      @courses = @user.course.all
    end
    slim :'user/show'
  end

  post '/create' do

    user = User.find_or_create_by(name: params[:name]) do |user|
      user.name  = params[:name]
      user.email = params[:email]
      user.password = params[:password]
      user.password_confirmation = params[:password_confirmation]
      p '--------------------------------------------------------------'
      p  params[:avatar]
      user.avatar =  params[:avatar]
    end

    sign_in user

    redirect to "../user/#{user.id}"
  end

end