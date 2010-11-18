require 'test_helper'

class Test < ActiveSupport::IntegrationCase

  test '/ to login' do
   visit '/'
   assert page.has_content?('Login')
  end

end
