require "test_helper"

class CampsitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campsite = campsites(:one)
  end

  test "should get index" do
    get campsites_url
    assert_response :success
  end

  test "should get new" do
    get new_campsite_url
    assert_response :success
  end

  test "should create campsite" do
    assert_difference("Campsite.count") do
      post campsites_url, params: { campsite: { name: @campsite.name, price: @campsite.price } }
    end

    assert_redirected_to campsite_url(Campsite.last)
  end

  test "should show campsite" do
    get campsite_url(@campsite)
    assert_response :success
  end

  test "should get edit" do
    get edit_campsite_url(@campsite)
    assert_response :success
  end

  test "should update campsite" do
    patch campsite_url(@campsite), params: { campsite: { name: @campsite.name, price: @campsite.price } }
    assert_redirected_to campsite_url(@campsite)
  end

  test "should destroy campsite" do
    assert_difference("Campsite.count", -1) do
      delete campsite_url(@campsite)
    end

    assert_redirected_to campsites_url
  end
end
