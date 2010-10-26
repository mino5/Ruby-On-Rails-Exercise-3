class CoursesController < ApplicationController
def new
 @course = Student.find(params[:student_id]).courses.new
end

def show
 @course = Course.find(params[:id])
end

def create
 student = Student.find(params[:student_id])
 student.courses.create(params[:course])
 redirect_to student
end

def edit
 @course = Course.find(params[:id])
 
end

def destroy
 student = Student.find(params[:student_id])
 @course = Course.find(params[:id])
 @course.destroy
 redirect_to student 
end

def update
 course = Course.find(params[:id])
 course.update_attributes(params[:course])
 redirect_to students_path
end

end
