class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :parent

  def initialize(args, parent)
    @args        = args
    @id          = args[:id].to_s
    @first_name  = args[:first_name].to_s
    @last_name   = args[:last_name].to_s
    @created_at  = Time.parse(args[:created_at].to_s)
    @updated_at  = Time.parse(args[:updated_at].to_s)
    @parent      = parent
  end
end