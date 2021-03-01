require 'test_helper'

class TwatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @twat = twats(:one)
  end

  test "should get index" do
    get twats_url
    assert_response :success
  end

  test "should get new" do
    get new_twat_url
    assert_response :success
  end

  test "should create twat" do
    assert_difference('Twat.count') do
      post twats_url, params: { twat: { name: @twat.name, user_id: @twat.user_id } }
    end

    assert_redirected_to twat_url(Twat.last)
  end

  test "should show twat" do
    get twat_url(@twat)
    assert_response :success
  end

  test "should get edit" do
    get edit_twat_url(@twat)
    assert_response :success
  end

  test "should update twat" do
    patch twat_url(@twat), params: { twat: { name: @twat.name, user_id: @twat.user_id } }
    assert_redirected_to twat_url(@twat)
  end

  test "should destroy twat" do
    assert_difference('Twat.count', -1) do
      delete twat_url(@twat)
    end

    assert_redirected_to twats_url
  end
end
