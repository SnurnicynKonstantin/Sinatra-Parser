class ParserCourse
  TIME_ZONE = 6
  ONE_HOUR = 3600
  URL = 'https://query.yahooapis.com/v1/public/yql?q=select+*+from+yahoo.finance.xchange+where+pair+=+%22USDRUB,EURRUB%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback='
  attr_reader :course

  def initialize
    @course = {}
  end

  def get_current_course
    #url = 'https://query.yahooapis.com/v1/public/yql?q=select+*+from+yahoo.finance.xchange+where+pair+=+%22USDRUB,EURRUB%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback='
    data = prepare_data(URL)

    date = Time.parse(data['query']['created']) + ONE_HOUR * TIME_ZONE
    date = date.strftime("%Y-%m-%e %H")
    @course.[]=('Date',date)

    data['query']['results']['rate'].each do |array|
      @course.[]=('USD/RUB',array['Rate']) if array['Name'] == 'USD/RUB'
      @course.[]=('EUR/RUB',array['Rate']) if array['Name'] == 'EUR/RUB'
    end
  end

  private

  def prepare_data(url)
    JSON.parse(RestClient.get(url))
  end

end