require 'spec_helper'

describe Admin::StudentsController do

before :each do
      @student = mock_model(Student)
      Student.stub!(:new).and_return(@student)
    end 	
 
end

