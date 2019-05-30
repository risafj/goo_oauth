require 'test_helper'

class OAuthsControllerTest < ActionDispatch::IntegrationTest
  test 'should get oauth' do
    get o_auths_oauth_url
    assert_response :success
  end

  test 'should get controller' do
    get o_auths_controller_url
    assert_response :success
  end
end
