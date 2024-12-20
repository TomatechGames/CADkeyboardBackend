require "application_system_test_case"

class KeyboardItemsTest < ApplicationSystemTestCase
  setup do
    @keyboard_item = keyboard_items(:one)
  end

  test "visiting the index" do
    visit keyboard_items_url
    assert_selector "h1", text: "Keyboard items"
  end

  test "should create keyboard item" do
    visit keyboard_items_url
    click_on "New keyboard item"

    fill_in "Amount", with: @keyboard_item.amount
    fill_in "Description", with: @keyboard_item.description
    fill_in "Manufacturer", with: @keyboard_item.manufacturer
    fill_in "Name", with: @keyboard_item.name
    fill_in "Price", with: @keyboard_item.price
    click_on "Create Keyboard item"

    assert_text "Keyboard item was successfully created"
    click_on "Back"
  end

  test "should update Keyboard item" do
    visit keyboard_item_url(@keyboard_item)
    click_on "Edit this keyboard item", match: :first

    fill_in "Amount", with: @keyboard_item.amount
    fill_in "Description", with: @keyboard_item.description
    fill_in "Manufacturer", with: @keyboard_item.manufacturer
    fill_in "Name", with: @keyboard_item.name
    fill_in "Price", with: @keyboard_item.price
    click_on "Update Keyboard item"

    assert_text "Keyboard item was successfully updated"
    click_on "Back"
  end

  test "should destroy Keyboard item" do
    visit keyboard_item_url(@keyboard_item)
    click_on "Destroy this keyboard item", match: :first

    assert_text "Keyboard item was successfully destroyed"
  end
end
