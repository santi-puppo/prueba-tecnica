require "application_system_test_case"

class CampgroundsTest < ApplicationSystemTestCase
  setup do
    @campground = campgrounds(:one)
  end

  test "visiting the index" do
    visit campgrounds_url
    assert_selector "h1", text: "Campgrounds"
  end

  test "should create campground" do
    visit campgrounds_url
    click_on "New campground"

    fill_in "Name", with: @campground.name
    fill_in "Price range", with: @campground.price_range
    click_on "Create Campground"

    assert_text "Campground was successfully created"
    click_on "Back"
  end

  test "should update Campground" do
    visit campground_url(@campground)
    click_on "Edit this campground", match: :first

    fill_in "Name", with: @campground.name
    fill_in "Price range", with: @campground.price_range
    click_on "Update Campground"

    assert_text "Campground was successfully updated"
    click_on "Back"
  end

  test "should destroy Campground" do
    visit campground_url(@campground)
    click_on "Destroy this campground", match: :first

    assert_text "Campground was successfully destroyed"
  end
end
