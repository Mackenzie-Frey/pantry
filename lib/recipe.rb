class Recipe

  attr_reader :ingredients

  def initialize(recipe_name)
    @ingredients = Hash.new
  end

  def add_ingredient(ingredient, quantity)
    @ingredients[ingredient] = quantity
  end


end
