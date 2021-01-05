require_relative './test_helper'
require './lib/sales_engine.rb'

class SalesEngineTest < Minitest::Test
  def setup
    @se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
    })
  end

  def test_it_exists
    assert_instance_of SalesEngine, @se
  end

  def test_it_has_attributes
  end
  def test_it_can_have_different_attributes
  end
end
