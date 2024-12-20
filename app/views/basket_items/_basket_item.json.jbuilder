json.extract! basket_item, :id, :user_id, :keyboard_item_id, :created_at, :updated_at
json.url basket_item_url(basket_item, format: :json)
