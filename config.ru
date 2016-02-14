require './config/environment'

#run PostController
map('/'){run CourseController}
map('/course'){run CourseController}