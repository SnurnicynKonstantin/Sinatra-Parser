class CreateCourse < ActiveRecord::Migration
  def self.up
    create_table :courses do |course|
      course.float     :usd
      course.float     :eur
      course.timestamps
    end

    Course.create(usd: 11.12,
                  eur: 22.12)
    Course.create(usd: 33.12,
                  eur: 44.12)
  end
  def self.down
    drop_table :courses
  end
end
