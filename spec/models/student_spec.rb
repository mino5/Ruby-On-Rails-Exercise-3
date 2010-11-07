require 'spec_helper'

describe Student do
#  pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @valid_attributes = {:name => "DDD", :pesel => "87053101711", :password => "www" }
  end
 
 it "should create a new instance given valid attributes" do
 Student.create!(@valid_attributes)
 end 
end
