require './config/environment'

use Rack::Coffee, root: 'public', urls: '/javascripts'

map('/') {run ApplicationController}
map('/course') {run CourseController}
map('/session') {run SessionController}
map('/user') {run UserController}