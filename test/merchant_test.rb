require_relative 'test_helper'

class MerchantTest < Minitest::Test
  def setup
    parent = mock('parent')
    @merchant = Merchant.new({
                              id: 7,
                              name: "Sherry's Tasty Desserts",
                              created_at: Time.now,
                              updated_at: Time.now
                              }, parent)
  end

  def test_it_exists
    assert_instance_of Merchant, @merchant
  end

  def test_it_has_attributes
    assert_equal 7, @merchant.id
    assert_equal "Sherry's Tasty Desserts", @merchant.name
    assert_operator Time.now.to_s, :==, @merchant.created_at.to_s
    assert_operator Time.now.to_s, :==, @merchant.updated_at.to_s
  end

  def test_it_can_update
    update_info = {id: 7, name: "Olivia's Tasty Desserts"}
    @merchant.update(update_info)
    assert_equal "Olivia's Tasty Desserts", @merchant.name
  end
end
