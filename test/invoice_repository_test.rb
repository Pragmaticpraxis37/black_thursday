require_relative 'test_helper'
require './invoice'
require './invoice_repository'
class InvoiceRepositoryTest < MiniTest::Test
  def setup
    merchant_path = "./data/merchants.csv"
    arguments = merchant_path
    #parent = mock("parent")
    @engine = SalesEngine.from_csv(arguments)
  end

  def test_it_exists
    invoice_id = 3452
    expected = @engine.invoices.find_by_id(invoice_id)
    assert_equal invoice_id, @expected.id
    assert_equal 12335690, @expected.merchant_id
    assert_equal 679, @expected.customer_id
    assert_equal :pending, @expected.status
    invoice_id = 5000
    expected = @engine.invoices.find_by_id(invoice_id)
    assert_nil expected
  end

  def test_find_all_by_customer_id
    customer_id = 300
    expected = @engine.invoices.find_all_by_customer_id(customer_id)
    assert_equal 10, expected.length
    customer_id = 1000
    expected = @engine.invoices.find_all_by_customer_id(customer_id)
    assert_equal [], @expected
  end

  def test_find_all_by_merchant_id
    merchant_id = 12335080
    expected = @engine.invoices.find_all_by_merchant_id(merchant_id)
    assert_equal 7, expected.length
    merchant_id = 1000
    expected = @engine.invoices.find_all_by_merchant_id(merchant_id)
    assert_equal [], expected
  end

  def test_find_all_by_status_returns_all_invoices_associated_with_given_status
    status = :shipped
    expected = @engine.invoices.find_all_by_status(status)

    assert_equal 2839, expected.length

    status = :pending
    expected = @engine.invoices.find_all_by_status(status)

    assert_equal 1473, expected.length

    status = :sold
    expected = @engine.invoices.find_all_by_status(status)

      assert_equal [], expected
  end

  def test_create_creates_a_new_invoice_instance
    attributes = {
      :customer_id => 7,
      :merchant_id => 8,
      :status      => "pending",
      :created_at  => Time.now,
      :updated_at  => Time.now,
    }
    @engine.invoices.create(attributes)
    expected = engine.invoices.find_by_id(4986)

    assert_equal 8, expected.merchant_id
  end

  def test_update_updates_an_invoice
    original_time = engine.invoices.find_by_id(4986).updated_at
    attributes = {
                  status: :success
                  }
  @engine.invoices.update(4986, attributes)
  expected = engine.invoices.find_by_id(4986)

  assert_equal :success, expected.status
  assert_equal 7, expected.customer_id
  assert_operator original_time ,:>, expected.updated_at 
  end
end
