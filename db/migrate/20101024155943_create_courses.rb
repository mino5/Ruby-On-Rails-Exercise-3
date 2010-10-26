class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.integer :student_id
      t.string :name
      t.integer :points
      t.boolean :mandatory

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
