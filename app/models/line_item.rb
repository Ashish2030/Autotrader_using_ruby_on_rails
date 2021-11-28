class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :old

  def total_price
    self.old.price * quantity
  end

end
