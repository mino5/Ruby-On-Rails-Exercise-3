class Admin::StudentsController < ApplicationController
  def index
    @search = Student.search(params[:search])
    @students = @search.paginate(:page => params[:page], :per_page => 4)
  end
  
  def show
   @students = Student.find(params[:id])
  end

  def edit
   @categories = Category.all
   @student = Student.find(params[:id])
  end

  def update
   student = Student.find(params[:id])
   student.update_attributes(params[:student])
   redirect_to admin_students_path
  end

  def new
   @categories = Category.all
   @student = Student.new
  end

  def create
  student = Student.create(params[:student])
  redirect_to admin_students_path
  end
 
  def destroy
  @student = Student.find(params[:id])
  @student.destroy
  redirect_to admin_students_path
  end
end
