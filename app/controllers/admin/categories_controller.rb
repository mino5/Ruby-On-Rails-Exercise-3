class Admin::CategoriesController < ApplicationController
   def index
   require_admin
   @categories = Category.all
   end

   def edit
   require_admin
   @category = Category.find(params[:id])
   end

   def new
   require_admin
   @category = Category.new
   end

   def create
   require_admin
   Category.create(params[:category])
   redirect_to admin_categories_path
   end

   def show
   require_admin
   @category = Category.find(params[:id])
   end
   
   def update
   require_admin
   category = Category.find(params[:id])
   category.update_attributes(params[:category])
   redirect_to admin_categories_path
   end

   def destroy
   require_admin
   @category = Category.find(params[:id])
   @category.destroy
   redirect_to admin_categories_path
   end
end
