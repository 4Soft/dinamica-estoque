class Product
  attr_accessor :name, :id, :supplier, :quantity, :price

  def initialize(params)
    @name = params[:name]
    @id = params[:id]
    @supplier = params[:supplier]
    @quantity = params[:quantity]
    @price = params[:price]
  end
end
