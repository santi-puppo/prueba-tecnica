require "application_system_test_case"

class CampsitesTest < ApplicationSystemTestCase
  setup do
    @campsite = campsites(:one)
  end

  test "visiting the index" do
    visit campsites_url
    assert_selector "h1", text: "Campsites"
  end

  test "should create campsite" do
    visit campsites_url
    click_on "New campsite"

    fill_in "Name", with: @campsite.name
    fill_in "Price", with: @campsite.price
    click_on "Create Campsite"

    assert_text "Campsite was successfully created"
    click_on "Back"
  end

  test "should update Campsite" do
    visit campsite_url(@campsite)
    click_on "Edit this campsite", match: :first

    fill_in "Name", with: @campsite.name
    fill_in "Price", with: @campsite.price
    click_on "Update Campsite"

    assert_text "Campsite was successfully updated"
    click_on "Back"
  end

  test "should destroy Campsite" do
    visit campsite_url(@campsite)
    click_on "Destroy this campsite", match: :first

    assert_text "Campsite was successfully destroyed"
  end
end
