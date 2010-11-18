class Course < ActiveRecord::Base
  belongs_to :student
  has_many :opinions
end
