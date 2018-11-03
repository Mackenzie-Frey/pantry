require './lib/recipe'

class Pantry

  attr_reader :stock, :shopping_list


  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
  end

  def stock_check(item)
    @stock[item]
  end

  def restock(item, quantity)
    @stock[item] += quantity
  end

  def add_to_shopping_list(r)
    r.ingredients.each do |ingredient, quantity|
      @shopping_list[ingredient] += quantity
    end
  end

end
