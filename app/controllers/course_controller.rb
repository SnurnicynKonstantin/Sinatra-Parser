class CourseController < HomeController

  get '/' do
    @courses = Course.order('created_at DESC')

    slim :'course/index'
  end

  post '/new' do
    parser = ParserCourse.new
    parser.get_current_course
    parse_course = parser.course

    one_course = Course.find_or_create_by(date: DateTime.parse(parse_course['Date'])) do |course|
      course.usd = parse_course['USD/RUB']
      course.eur = parse_course['EUR/RUB']
      course.date = parse_course['Date']
    end

    current_user.course << one_course unless current_user.course.exists?(one_course.id)

    #redirect to '/'
  end

  get '/getdata.json' do
    puts "YeSSSSS!!!!!!!!!!!!!!!!"
    content_type :json
    if current_user.admin?
      data = Course.all
    else
      data = current_user.course.all
    end

    data.to_json
  end

  get '/:id' do
    @course = Course.find(params[:id])
    slim :'course/show'
  end

end