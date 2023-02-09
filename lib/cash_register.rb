class CashRegister
  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @register_items = []
  end

  class RegisterItem

    attr_accessor :title
    attr_accessor :price

    def initialize(title, price)
      self.title = title
      self.price = price
    end

    def toString
      "#{self.title} (#{self.price})"
    end
  end

  attr_accessor :total

  def add_item(title, price, quantity=1)
    self.total = @total + (price * quantity)
    quantity.times { @register_items.push(RegisterItem.new(title, price)) }
  end

  def apply_discount
    if @discount == nil
      return "There is no discount to apply."
    else
      self.total = (@total * (100-@discount) / 100)
    end
    "After the discount, the total comes to $#{@total}."
  end

  def items
    @register_items.map { |item| item.title }
  end

  def void_last_transaction
    self.total = (@total - @register_items.pop.price)
  end
end

# cash_register = CashRegister.new(30)
# cash_register.add_item("apple", 0.99,2)
# cash_register.add_item("tomato", 1.76,3)
# p cash_register.items
# cash_register.void_last_transaction
# p cash_register.items
# cash_register.void_last_transaction
# p cash_register.items
# puts cash_register.total
