require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get home_index_url
    assert_response :success

    # Check for server timing header
    assert_equal 'app;dur=1.0', response.headers['Server-Timing']
  end
end
