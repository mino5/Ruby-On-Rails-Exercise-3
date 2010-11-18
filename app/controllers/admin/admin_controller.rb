class Admin::AdminController < ApplicationController
protect_from_forgery

helper :all

def index
require_admin
end

def show
require_admin
end

 
end
