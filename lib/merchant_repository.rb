require_relative "merchant"
require_relative 'repository_module'
require "csv"
require 'time'


class MerchantRepository
  include Repository
  attr_reader :filename,
              :collection,
              :parent

  def initialize(filename, parent)
    @filename = filename
    @parent = parent
    @collection = Array.new
    generate_merchants(filename)
  end

  def generate_merchants(filename)
    merchants = CSV.open filename, headers: true, header_converters: :symbol
    merchants.each do |row|
      @collection << Merchant.new(row, self)
    end
  end

  def find_all_by_name(name)
    found_merchants = collection.find_all do |merchant|
      merchant.name.downcase.include?(name.downcase)
    end
  end

  def create(attributes)
    attributes[:id] = highest_id_plus_one.to_s
    attributes[:name]
    new_merchant = Merchant.new(attributes, self)
    @collection << new_merchant
    new_merchant
  end

  def update(id, attributes)
    update_merchant = find_by_id(id)
    update_merchant.update(attributes) if !attributes[:name].nil?
    update_merchant
  end

end
