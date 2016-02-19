class AddDateField < ActiveRecord::Migration
  change_table :courses do |course|
    course.datetime :date
  end
end
