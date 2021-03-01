require "application_system_test_case"

class TwatsTest < ApplicationSystemTestCase
  setup do
    @twat = twats(:one)
  end

  test "visiting the index" do
    visit twats_url
    assert_selector "h1", text: "Twats"
  end

  test "creating a Twat" do
    visit twats_url
    click_on "New Twat"

    fill_in "Name", with: @twat.name
    fill_in "User", with: @twat.user_id
    click_on "Create Twat"

    assert_text "Twat was successfully created"
    click_on "Back"
  end

  test "updating a Twat" do
    visit twats_url
    click_on "Edit", match: :first

    fill_in "Name", with: @twat.name
    fill_in "User", with: @twat.user_id
    click_on "Update Twat"

    assert_text "Twat was successfully updated"
    click_on "Back"
  end

  test "destroying a Twat" do
    visit twats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Twat was successfully destroyed"
  end
end
