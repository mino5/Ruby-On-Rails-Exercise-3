require 'spec_helper'
def login_as_admin  
     user = User.new(:login => "Admin555", :password => "pass", :password_confirmation => "pass")  
     user.is_admin = true  
     user.save! 
     visit('/')
     fill_in 'Login', :with => 'Admin555'
     fill_in 'Password', :with => 'pass'
     click 'Login' 
     #session[:user_id] = user.id    
end

def login_as_student
    user = User.new(:login => "Student555", :password => "pass", :password_confirmation => "pass")
    user.is_admin = false
    user.save!
    visit('/')
    fill_in 'Login', :with => 'Student555'
    fill_in 'Password', :with => 'pass'
    click 'Login'
end

def new_category
    @valid_attributes = {:name => 'M'}
    return Category.create!(@valid_attributes)
end

def new_student(studentname, categoryid) # fixme: zamiast create, ręcznie dodajemy
    @valid_attributes = {:name => studentname, :pesel => "87053101711", :password => "passsssssss", :category_id => categoryid} 
    student = Student.create!(@valid_attributes)
    return student
end

def new_course(coursename, studentid)
    @valid_attributes = {:name => coursename, :points => 5, :student_id => studentid}
    course = Course.create!{@valid_attributes}
end

def give_opinion
    click 'Give opinion'
    page.should have_content ("Send opinion")
    fill_in 'Text', :with => "Test"
    click 'Create Opinion'
end

describe "adding a course and gives an opinion" do
  it "new course should be seen for admin" do
   visit ('/admin')
   page.should have_content ("Login")
   login_as_admin
   category = new_category
   student = new_student("Student", category.id)
   visit ('/students/' + student.id.to_s())
   page.should have_content ("Pesel:")
   course = new_course("Adminkurs", student.id)
   visit ('/students/' + student.id.to_s() + '/courses/' + course.id.to_s())
   give_opinion   
   visit ('/admin/courses/' + course.id.to_s())
   page.should have_content ("Test")
   visit ('/')
   page.should have_link ("Sign out")
   click 'Sign out'
   visit ('/')
   page.should have_content ("Login")
  end
 end

describe "can't give opinion twice" do
  it "student shouldn't be able to give opinion on the same course twice" do
    category = new_category
    visit('/') 
    page.should have_content ("Login") 
    login_as_student
    student = new_student("student5", category.id)
    visit('/students/' + student.id.to_s())
    page.should have_content ("Pesel:")
    course = new_course("Studentkurs", student.id)
    visit ('/students/' + student.id.to_s() + '/courses/' + course.id.to_s())
    give_opinion
    visit ('/students/' + student.id.to_s() + '/courses/' + course.id.to_s())
    page.should have_content ("Already sent opinion.")
  end 
 end
