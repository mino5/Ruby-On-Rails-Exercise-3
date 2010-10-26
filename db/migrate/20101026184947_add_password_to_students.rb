class AddPasswordToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :password, :string
  end

  def self.down
    remove_column :students, :password
  end
end
