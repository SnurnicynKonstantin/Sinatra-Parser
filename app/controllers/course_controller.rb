class CourseController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, '../views/') }

  get '/' do
    @courses = Course.order('created_at DESC')

    slim :index
  end

  get '/new' do
    parser = ParserCourse.new
    parser.get_current_course
    parse_course = parser.course

    #courses = Course.all

    course = Course.create(usd: parse_course['USD/RUB'], eur: parse_course['EUR/RUB'])
    course.save

    redirect to '/'
  end

  get '/:id' do
    @course = Course.find(params[:id])
    slim :'course/show'
  end
end