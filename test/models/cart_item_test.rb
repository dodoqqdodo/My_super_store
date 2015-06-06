require 'test_helper'

class CartItemTest < ActiveSupport::TestCase
  
  test "cart item can calculate price" do
    cart =Cart.new
    p1= Product.create(name:'ruby', price:100)
    p2= Product.create(name:'php', price:50)
    
    5.times do
      cart.add_item(p1.id)
    end
    
    3.times do
      cart.add_item(p2.id)
    end
    
    assert_equal 500, cart.items.first.price
    assert_equal 150, cart.items.second.price
  end
  
  test "cart can serialize to hash" do
    cart = Cart.new
    cart.add_item(1)
    cart.add_item(1)
    cart.add_item(2)
    cart.add_item(2)
    cart.add_item(2)
    assert_equal session_hash, cart.serialize
    
    
  end
  
  
  test "can build a cart from hash" do
   
    cart = Cart.build_from_hash(session_hash)
    assert_equal 1, cart.items.first.item_id
    assert_equal 2, cart.items.first.quantity
    
    assert_equal 2, cart.items.second.item_id
    assert_equal 3, cart.items.second.quantity
    
  end
  
  private
  def session_hash
    {
      "cart" =>
      [
        {"item_id" => 1, "quantity" => 2},
        {"item_id" => 2, "quantity" => 3},
        ]
    }
  end
end

 #p1 = Product.create(name:'ruby',price:100)
  #  p2 = Product.create(name:'php',price:100)
#    
 #   2.times do
  #    cart.add_item(p1.id)
  #  end
  #  3.times do
  #    cart.add_item(p2.id)
  #  end