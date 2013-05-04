class User
  attr_accessor :type
  attr_reader :login, :pass

  def initialize(params)
    @type = params[:type]
    @login = params[:login]
    @pass = params[:pass]
  end
end
