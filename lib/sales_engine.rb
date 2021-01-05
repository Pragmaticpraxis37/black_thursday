class SalesEngine
  

  def from_csv(hash)
    hash.each do |key, value|
      require "pry"; binding.pry
      item = key.new(value)
    end
  end
end
