require_relative 'test_helper'

class ItemTest < Minitest::Test
  def setup
    parent = mock('parent')
    @i = Item.new({
                   id:           34,
                   name:         "Spoon",
                   description:  "You can use it to eat soup, etc.",
                   unit_price:   BigDecimal.new(11.30,4).to_d * 100,
                   created_at:   Time.now,
                   updated_at:   Time.now,
                   merchant_id:  67
    }, parent)
  end

  def test_it_exists
    assert_instance_of Item, @i
  end

  def test_it_has_attributes
    assert_equal 34, @i.id
    assert_equal "Spoon", @i.name
    assert_equal "You can use it to eat soup, etc.", @i.description
    assert_equal 11.30, @i.unit_price
    assert_operator Time.now.to_s, :==, @i.created_at.to_s
    assert_operator Time.now.to_s, :==, @i.updated_at.to_s
    assert_equal 67, @i.merchant_id
  end

  def test_unit_price_to_dollars_returns_price_as_float
    assert_equal 11.30, @i.unit_price_to_dollars
  end
end