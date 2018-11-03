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
    what_i_can_make = []
    @cookbook.each do |recipe_name, recipe_object|
      recipe_object.ingredients.each do |ingredient_name, ingredient_quantity|
        @stock.each do |stock_name, stock_quantity|
          if stock_name == ingredient_name && stock_quantity > ingredient_quantity
            what_i_can_make << recipe_name
          end
        end
      end
    end
    what_i_can_make.uniq
  end

  def how_many_can_i_make
    quantity_to_make = {}
    what_can_i_make.each do |recipe_name|
      binding.pry
      @cookbook[recipe_name].ingredients.each do |ingredient_name, ingredient_quantity|
        binding.pry
        @stock.each do |stock_name, stock_quantity|
          if stock_name == ingredient_name
            amount_can_make = stock_quantity / ingredient_quantity
            quantity_to_make[recipe_name] = amount_can_make
          end
        end
      end
    end

  end


end
