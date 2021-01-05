require_relative './test_helper'
require './lib/sales_engine'
require './lib/merchant_repository'
class MerchantRepositoryTest < Minitest::Test
  def setup
    merchant_path = "./data/merchant_repo_test.csv"
    arguments = merchant_path
    @mr = MerchantRepository.new(arguments)
  end

  def test_it_exists_and_has_attributes
    assert_instance_of MerchantRepository, @mr
    assert_equal  4, @mr.merchants.length
  end

  def test_it_has_attributes
    assert_equal 12334105, @mr.merchants.first.id
    assert_equal 'Shopin1901', @mr.merchants.first.name
  end

  # def test_it_can_have_different_attributes
  #   skip
  # end
end
