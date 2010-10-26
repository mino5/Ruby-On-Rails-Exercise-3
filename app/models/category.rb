class Category < ActiveRecord::Base
  has_many :students
end
