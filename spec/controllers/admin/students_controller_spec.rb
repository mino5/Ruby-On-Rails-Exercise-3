require 'spec_helper'

describe Admin::StudentsController do

before :each do
      @student = mock_model(Student)
      Student.stub!(:new).and_return(@student)
    end

describe "POST CREATE" do

   describe "when successful" do

        before :each do
          @student.stub!(:save).and_return(true)
        end

	it "should create student" do
          Student.should_receive(:new).with("pesel" => "87053101711").and_return(@student)
   	  post 'create' , :student => {"pesel" => '87053101711' }
        end

	it "should save student" do
	  @student.should_receive(:save).and_return(true)
 	  post :create
        end  
	
	it "should redirect to the admin_students_path" do
  	  post :create
  	  response.should redirect_to(admin_students_path)
	end   
    end
  
  describe "when unsuccessful" do
   before :each do
    @student.stub!(:save).and_return(false)
   end

   it "should render" do
     post :create
     response.should render_template()
   end

  end
end
 
end

