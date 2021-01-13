require 'time'
class Merchant
  attr_reader :id,
              :name,
              :parent,
              :created_at,
              :updated_at

  def initialize(args, parent)
    @id = args[:id].to_i
    @name = args[:name].to_s
    @created_at  = Time.parse(args[:created_at].to_s)
    @updated_at  = Time.parse(args[:updated_at].to_s)
    @parent = parent
  end

  def update(args)
    @name = (args[:name].to_s) if !args[:name].to_s.nil?
    @updated_at = Time.now
  end

end
