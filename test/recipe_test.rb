require 'minitest/pride'
require 'minitest/autorun'
require 'pry'
require './lib/recipe'

class RecipeTest < Minitest::Test

  def test_it_exists
    r = Recipe.new("Cheese Pizza")
    assert_instance_of Recipe, r
  end

  def test_it_has_ingredients
    r = Recipe.new("Cheese Pizza")
    assert_equal ({}), r.ingredients
  end

  def test_it_adds_ingredients
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    assert_equal ({"Cheese" => 20, "Flour" => 20}), r.ingredients
  end


end
