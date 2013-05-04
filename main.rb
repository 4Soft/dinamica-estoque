require_relative 'sell.rb'
require_relative 'stock.rb'
require_relative 'list_user.rb'
require_relative 'user.rb'
require_relative 'supplier.rb'
require_relative 'product.rb'

class Main

  def initialize
    @stock = Stock.new
    @user_list = ListUser.new
    @current_user = nil
    @suppliers = {}

    @methods = [
      "exit",
      "create_user",
      "login",
      "add_product",
      "add_supplier",
      "make_sell",
      "add_products_to_stock"
    ]
  end

  def menu
    puts "Select an option"
    puts "1-Create a user"
    puts "2-Login"
    puts "3-Add a product"
    puts "4-Add a supplier"
    puts "5-Make a sell"
    puts "6-Add products to stock"
    puts "0-Exit"
  end

  def create_user
    puts "Enter the name, the password, and type of the user separated by spaces"

    login, pass, type = gets.split(" ")

    @user_list.sign_up(User.new({login: login, pass: pass, type: type}))
  end

  def login
    puts "Enter your name and password"

    login, pass = gets.split(" ")

    @current_user = @user_list.sign_in(User.new({login: login, pass: pass}))
  end

  def add_product
    puts "Enter the id, the name, the initial quantity, the supplier name, and the price of the product"

    id, name, qtd, supplier, price = gets.split(" ")

    @stock.register_product(Product.new({id: id.to_i, name: name, quantity: qtd.to_i,
      supplier: @suppliers[supplier], price: price.to_i}))
  end

  def add_supplier
    puts "Enter the name, cnpj and the phone of the supplier"

    name, cnpj, phone = gets.split(" ")

    @suppliers[name] = Supplier.new({name: name, cnpj: cnpj, phone: phone})

    puts "Supplier #{name} added"
  end

  def make_sell
    aux = "yes"
    itens = []

    while (aux != "no")
      puts "Add the product name, and the quantity to sell"

      pname, qtd = gets.split(" ")

      itens << [@stock.get_product(pname), qtd.to_i]

      puts "Want to add more itens?"
      aux = gets.chomp!
    end

    sell = Sell.new(itens)
    sell.pretty_print

    @stock.do_sell(sell)
  end

  def add_products_to_stock
    if (@current_user.type != "estoquista")
      puts "You dont have permission to do it"
      return
    end

    puts "Enter the name of the product and the quantity to add"

    pname, qtd = gets.split(" ")

    @stock.receive_product(Product.new({name: pname}), qtd.to_i)
  end

  def exit
    Process.exit(0)
  end

  def main
    puts "Stock manager 4Soft"
    puts "==================="

    puts "What you want to do?"

    menu
    
    option = gets.to_i
    
    loop {
      self.send(@methods[option])
      menu
      option = gets.to_i
    }
  end
end

app = Main.new
app.main
