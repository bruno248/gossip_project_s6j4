require 'test_helper'

class StaticpageControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get staticpage_welcome_url
    assert_response :success
  end

  test "should get team" do
    get staticpage_team_url
    assert_response :success
  end

  test "should get contact" do
    get staticpage_contact_url
    assert_response :success
  end

end
