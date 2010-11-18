require 'spec_helper'

describe User do

  before(:each) do
   @valid_attributes = { :login => "User", :password => "pass", :password_confirmation => "pass" }
  end
 
describe "User registering" do 
  it "should create given valid attributes" do
   User.create!(@valid_attributes)
   User.find(:all).length.should >= 1 
  end
  
  it "should require password" do
   user = User.new(@valid_attributes.merge(:password => ""))
   user.should_not be_valid
  end

  it "should have password and password_confirmation equal" do
   user = User.new(@valid_attributes.merge(:password_confirmation => "pass2"))
   user.should_not be_valid
  end
  
  it "should require password length >=4" do
   user = User.new(@valid_attributes.merge(:password => "aaa", :password_confirmation => "aaa"))
   user.should_not be_valid
   User.create!(@valid_attributes.merge(:password => "aaaa", :password_confirmation => "aaaa"))
  end

  it "should have is_admin = 0 by default" do
   user = User.create!(@valid_attributes)
   user.is_admin.should == false
  end
end

describe "Admin" do

  it "should respond to is_admin" do
   @user = User.create!(@valid_attributes)
   @user.should respond_to(:is_admin)
  end

end

end
