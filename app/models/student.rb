require 'md5'
class Student < ActiveRecord::Base
 has_many :courses, :dependent => :destroy
 belongs_to :category
 before_save :cipher_password
 validates :name, :presence => true, :length => {:maximum => 100, :message => 'Name too long'}
 validates :pesel, :presence => true, :length => {:is => 11, :message => 'Pesel must have 11 digits'}
 validates :password, :presence => true

 private 
 	def cipher_password
		write_attribute("password", MD5.new(password).to_s)
        end
 end




