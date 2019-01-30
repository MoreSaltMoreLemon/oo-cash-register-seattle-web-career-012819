class CashRegister

  attr_accessor :discount, :total

  def initialize(employee_discount = 0)
    @total = 0
    @discount = employee_discount
    @cart = []
  end

  def add_item(item, price, quantity = 1)
    @cart << { item_name: item, price: price, quantity: quantity}
    self.total += price * quantity
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    end

    self.total = (self.total.to_f * ((100.to_f - @discount.to_f) / 100.to_f)).to_i
    "After the discount, the total comes to $#{self.total}."
  end

  def items
    items_in_cart = []
    @cart.each do |item| 
      item[:quantity].times do |i|
        items_in_cart << item[:item_name]
      end
    end
    items_in_cart
  end

  def void_last_transaction
    voided = @cart.pop
    self.total -= voided[:price] * voided[:quantity]
  end

end
