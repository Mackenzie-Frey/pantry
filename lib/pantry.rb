require './lib/recipe'

class Pantry

  attr_reader :stock, :shopping_list, :cookbook


  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
    @cookbook = Hash.new(0)
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

  def add_to_cookbook(r)
    @cookbook[r.name] = r
  end

  def what_can_i_make
    recipes_with_stock = []
    @cookbook.each do |recipe_name, recipe_object|
      @stock.each do |stock_item, stock_quantity|
        recipe_object.ingredients.each do |recipe_ingredient, recipe_amount|
           if recipe_ingredient == stock_item && stock_quantity > recipe_amount
            # binding.pry
             recipes_with_stock << recipe_name
           end
        end
      end
    end
    recipes_with_stock
  end

end
