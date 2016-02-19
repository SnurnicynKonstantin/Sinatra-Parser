build_gpaphic = ->
  $.ajax
    url: '/course/getdata.json'
    type: 'GET'
    success: (data) ->
      usd = []
      eur = []
      date = []
      i = 0
      while i < data.length
        usd[i] = data[i]['usd']
        eur[i] = data[i]['eur']
        date[i] = parse_date(data[i]['date'])
        i++
      dd = [
        usd
        eur
        date
      ]
      highcharts_g dd
      return
  return

parse_date = (date) ->
  new_date = date.substring(8, 10)
  new_date += '.' + date.substring(5, 7)
  new_date += '.' + date.substring(0, 4)
  new_date += ' ' + date.substring(11, 13)
  new_date += ':00'
  new_date

highcharts_g = (data) ->
  $('#graphic').highcharts
    title:
      text: 'Курс валют'
      x: -20
    subtitle:
      text: 'Kredo: Keep Calm And Work                           '
      x: -20
    xAxis: categories: data[2]
    yAxis:
      title: text: 'Курс EUR, USD'
      plotLines: [ {
        value: 0
        width: 1
        color: '#808080'
      } ]
    tooltip: valueSuffix: ' RUB'
    series: [
      {
        name: 'USD'
        data: data[0]
      }
      {
        name: 'EUR'
        data: data[1]
      }
    ]
  return

$(document).ready ->
  $('.get-course-data').click ->
    $.post '/course/new', ->
      build_gpaphic()
      return
    return
  build_gpaphic()
  return

# ---
# generated by js2coffee 2.1.0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           