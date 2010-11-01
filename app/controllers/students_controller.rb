class StudentsController < ApplicationController
  def index
  require_user
  @students = Student.all
  end

  def show
  require_user
  @student = Student.find(params[:id])
  end

end
