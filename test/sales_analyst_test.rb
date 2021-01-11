require './test/test_helper'

class SalesAnalystTest < Minitest::Test
  def setup
    item_path = "./data/items.csv"
    merchant_path = "./data/merchants.csv"
    invoice_path = "./data/invoices.csv"
    arguments = {
                  :items     => item_path,
                  :merchants => merchant_path,
                  :invoices  => invoice_path
                }
    @se = SalesEngine.from_csv(arguments)
    @sales_analyst = @se.analyst
  end

  def test_it_exists
    assert_instance_of SalesAnalyst, @sales_analyst
  end

  def test_it_has_parent
    assert_instance_of SalesEngine, @sales_analyst.parent
  end

  def test_it_can_return_average_items_per_merchant
    assert_equal 2.88, @sales_analyst.average_items_per_merchant
  end

  def test_all_items_count_helper
    assert_equal 1367, @sales_analyst.all_items_count
  end

  def test_all_merchants_count_helper
    assert_equal 475, @sales_analyst.all_merchants_count
  end

  def test_average_items_per_merchant_standard_deviation
    assert_equal 3.26, @sales_analyst.average_items_per_merchant_standard_deviation
  end

  def test_it_display_merchants_with_high_item_count
    assert_equal 52, @sales_analyst.merchants_with_high_item_count.length
  end

  def test_generate_merchant_ids_helper
    assert_equal 475, @sales_analyst.generate_merchant_ids.length
  end

  def test_it_can_returns_the_average_item_price_for_the_given_merchant
    assert_equal 16.66, @sales_analyst.average_item_price_for_merchant(12334105)
  end

  def test_it_returns_the_average_price_for_all_merchants
    assert_equal 350.29, @sales_analyst.average_average_price_per_merchant
  end

  def test_returns_items_that_are_two_standard_deviations_above_the_average_price
    assert_equal 5, @sales_analyst.golden_items.length
  end

  def test_items_count_per_merchant_helper
    assert_equal 475, @sales_analyst.items_count_per_merchant.length
  end

  def test_all_items_minus_one_helper
    assert_equal 474, @sales_analyst.all_items_minus_one
  end

  def test_standard_deviation_calculation_helper
    total = 2
    collection_length = 2
    assert_equal 1, @sales_analyst.standard_deviaton_calculation(total, collection_length)
  end

  def test_mean_prices_per_merchant_helper
    assert_equal 475, @sales_analyst.mean_prices_per_merchant.length 
  end
end
