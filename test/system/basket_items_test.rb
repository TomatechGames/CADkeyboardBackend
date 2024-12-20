require "application_system_test_case"

class BasketItemsTest < ApplicationSystemTestCase
  setup do
    @basket_item = basket_items(:one)
  end

  test "visiting the index" do
    visit basket_items_url
    assert_selector "h1", text: "Basket items"
  end

  test "should create basket item" do
    visit basket_items_url
    click_on "New basket item"

    fill_in "Keyboard item", with: @basket_item.keyboard_item_id
    fill_in "User", with: @basket_item.user_id
    click_on "Create Basket item"

    assert_text "Basket item was successfully created"
    click_on "Back"
  end

  test "should update Basket item" do
    visit basket_item_url(@basket_item)
    click_on "Edit this basket item", match: :first

    fill_in "Keyboard item", with: @basket_item.keyboard_item_id
    fill_in "User", with: @basket_item.user_id
    click_on "Update Basket item"

    assert_text "Basket item was successfully updated"
    click_on "Back"
  end

  test "should destroy Basket item" do
    visit basket_item_url(@basket_item)
    click_on "Destroy this basket item", match: :first

    assert_text "Basket item was successfully destroyed"
  end
end
