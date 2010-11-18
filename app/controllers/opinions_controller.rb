class OpinionsController < ApplicationController
def new
 @opinion = Course.find(params[:course_id]).opinions.new
end

def show
 @opinion = Opinion.find(params[:id])
end

def create
 course = Course.find(params[:course_id])
 course.opinions.create(params[:opinion])
 redirect_to students_path #fixme: chcemy potem do students->course
end

end
