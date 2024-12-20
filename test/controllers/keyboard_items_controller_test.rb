require "test_helper"

class KeyboardItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @keyboard_item = keyboard_items(:one)
  end

  test "should get index" do
    get keyboard_items_url
    assert_response :success
  end

  test "should get new" do
    get new_keyboard_item_url
    assert_response :success
  end

  test "should create keyboard_item" do
    assert_difference("KeyboardItem.count") do
      post keyboard_items_url, params: { keyboard_item: { amount: @keyboard_item.amount, description: @keyboard_item.description, manufacturer: @keyboard_item.manufacturer, name: @keyboard_item.name, price: @keyboard_item.price } }
    end

    assert_redirected_to keyboard_item_url(KeyboardItem.last)
  end

  test "should show keyboard_item" do
    get keyboard_item_url(@keyboard_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_keyboard_item_url(@keyboard_item)
    assert_response :success
  end

  test "should update keyboard_item" do
    patch keyboard_item_url(@keyboard_item), params: { keyboard_item: { amount: @keyboard_item.amount, description: @keyboard_item.description, manufacturer: @keyboard_item.manufacturer, name: @keyboard_item.name, price: @keyboard_item.price } }
    assert_redirected_to keyboard_item_url(@keyboard_item)
  end

  test "should destroy keyboard_item" do
    assert_difference("KeyboardItem.count", -1) do
      delete keyboard_item_url(@keyboard_item)
    end

    assert_redirected_to keyboard_items_url
  end
end
