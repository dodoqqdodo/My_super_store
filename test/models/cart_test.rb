require 'test_helper'

class CartTest < ActiveSupport::TestCase
  
  test "cart should be able to add item" do
    cart =Cart.new
    cart.add_item(1)
    assert_equal false, cart.empty?
  end
  
  test "add more items to cart" do
    cart = Cart.new
    5.times do 
      cart.add_item(1)
    end
    3.times do 
      cart.add_item(2)
    end
    2.times do 
      cart.add_item(1)
    end
    
    assert_equal 2, cart.items.count
    assert_equal 7, cart.items.first.quantity
    assert_equal 3, cart.items.second.quantity
  end
  
  test "can get product from cart" do
    cart = Cart.new
    p1 =Product.create(name:'Ruby Book', price:10)
    cart.add_item(p1.id)
  
    assert_kind_of Product, cart.items.first.product
    assert_equal 'Ruby Book', cart.items.first.product.name
  end
    
  test "can calculate totla price" do
    cart =Cart.new
    p1= Product.create(name:'ruby', price:100)
    p2= Product.create(name:'php', price:50)
    
    5.times do
      cart.add_item(p1.id)
    end
    
    3.times do
      cart.add_item(p2.id)
    end
    
    assert_equal 650, cart.total_price
    
  end
end
