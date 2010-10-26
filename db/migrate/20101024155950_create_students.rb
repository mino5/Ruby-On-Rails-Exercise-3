class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|

      t.integer :category_id
      t.string :name
      t.string :pesel
      
      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
