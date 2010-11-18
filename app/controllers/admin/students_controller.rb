class Admin::StudentsController < ApplicationController
  def index
    require_admin
    @search = Student.search(params[:search])
    @students = @search.paginate(:page => params[:page], :per_page => 4)
  end
  
  def show
   require_admin
   @students = Student.find(params[:id])
  end

  def edit
   require_admin
   @categories = Category.all
   @student = Student.find(params[:id])
  end

  def update
   require_admin
   student = Student.find(params[:id])
   student.update_attributes(params[:student])
   redirect_to admin_students_path
  end

  def new
   require_admin
   @categories = Category.all
   @student = Student.new
  end

  def create
  require_admin
  student = Student.create(params[:student])
  redirect_to admin_students_path
  end
 
  def destroy
  require_admin
  @student = Student.find(params[:id])
  @student.destroy
  redirect_to admin_students_path
  end
end


