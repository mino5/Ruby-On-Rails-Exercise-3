require 'spec_helper'

#session = Capybara::Session.new(:rack_test, Capybara.app)

describe "VISITING AS GUEST" do
  it "should go to login" do
  visit ('/')
  page.should have_content("Log in")
  end
end

def register
visit('/')
click_link 'Register'
fill_in 'Login', :with => 'user5'
fill_in 'Password', :with => 'user5'
fill_in 'Password confirmation', :with => 'user5'
click 'Register'
end

describe "REGISTERING" do
  it "should have log out if you are registered" do
  register
  visit ('/')
  page.should have_content ("Sign out")
  end
end

describe "GOING TO /ADMIN WITHOUT PRIVILEGES" do
  it "shouldn't give you privileges if you are not logged in" do
  visit ('/admin')
  page.should have_content ("Login")
  end
  
  it "shouldn't give you privileges if you are logged in but not admin" do
  register
  visit('/admin')
  page.should have_content ("Sign out")
  end
end

