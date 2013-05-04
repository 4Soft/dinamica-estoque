class Supplier
  attr_accessor :name, :cnpj, :phone

  def initialize(params)
    @name = params[:name]
    @cnpj = params[:cnpj]
    @phone = params[:phone]
  end
end
