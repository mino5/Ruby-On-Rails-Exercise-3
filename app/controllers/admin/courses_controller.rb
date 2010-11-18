class Admin::CoursesController < ApplicationController
   def index
   require_admin
   @courses = Course.all
   end
  
   def show
   require_admin
   @course = Course.find(params[:id])
   end
end

