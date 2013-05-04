class Stock < Hash
  def receive_product(product, qtd)
    self[product.name].quantity += qtd

    puts "Received #{qtd} unit(s) of #{product.name} | Stock: #{self[product.name].quantity}"
  end

  def give_product(product, qtd)
    self[product.name].quantity -= qtd

    if (self[product.name].quantity < 0)
      self[product.name].quantity += qtd
      puts "Not enough itens"
    else
      puts "Gave #{qtd} unit(s) of #{product.name} | Stock: #{self[product.name].quantity}"
    end
  end

  def register_product(product)
    self[product.name] = product

    puts "Registered product #{product.name}"
  end

  def get_product(name)
    self[name]
  end

  def do_sell(sell)
    sell.itens.each do |product, qtd|
      give_product(product, qtd)
    end
  end
end
