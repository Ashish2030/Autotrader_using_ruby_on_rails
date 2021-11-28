class Cart < ApplicationRecord
  has_many :line_items, :dependent => :destroy

  def add_product(old_id)
    puts "---------store id-------"
    puts old_id
    puts "---------store end id-------"
    puts "--------------"
    puts line_items.inspect
    puts "------end---------"
    current_item = line_items.find_by_old_id(old_id)
    puts current_item.inspect
    puts "-------------------------------------"
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:old_id => old_id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum {|item| item.total_price}
  end

end
