class CreateTableUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |u|
      u.string :file
      u.timestamps
    end
  end
end
