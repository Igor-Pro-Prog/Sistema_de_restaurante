class ItemMenu
  attr_accessor :nome, :preco

  def initialize(nome, preco)
    @nome = nome
    @preco = preco
  end

  def to_s
    "#{nome}: R$#{preco}"
  end
end

class Pedido
  attr_accessor :itens, :total, :cliente, :desconto

  def initialize(cliente)
    @cliente = cliente
    @itens = []
    @total = 0.0
    @desconto = 0.0
  end

  def adicionar_item(item)
    @itens << item
    @total += item.preco
  end

  def remover_item(item)
    @itens.delete(item)
    @total -= item.preco
  end

  def aplicar_desconto(desconto)
    @desconto = desconto
    @total -= desconto
  end

  def exibir_pedido
    puts "Pedido do Cliente: #{@cliente}"
    puts "Itens:"
    @itens.each { |item| puts "- #{item}" }
    puts "Total: R$#{total}"
    puts "Desconto aplicado: R$#{desconto}"
    puts "Total a pagar: R$#{total - desconto}"
  end
end

class Cardapio
  attr_accessor :itens

  def initialize
    @itens = []
  end

  def adicionar_item(nome, preco)
    item = ItemMenu.new(nome, preco)
    @itens << item
  end

  def remover_item(nome)
    item = @itens.find { |item| item.nome == nome }
    @itens.delete(item) if item
  end

  def exibir_cardapio
    puts "Cardápio:"
    @itens.each { |item| puts "- #{item}" }
  end
end

class Cliente
  attr_accessor :nome, :telefone

  def initialize(nome, telefone)
    @nome = nome
    @telefone = telefone
  end

  def to_s
    "#{nome} - Telefone: #{telefone}"
  end
end

# Criação do cardápio
cardapio = Cardapio.new

# Adicionar itens ao cardápio
cardapio.adicionar_item("Hambúrguer", 10.0)
cardapio.adicionar_item("Pizza", 20.0)
cardapio.adicionar_item("Refrigerante", 5.0)

# Exibir cardápio
cardapio.exibir_cardapio

# Criação de um cliente
cliente1 = Cliente.new("João", "123456789")
cliente2 = Cliente.new("Maria", "987654321")

# Criação de um pedido para o cliente1
pedido1 = Pedido.new(cliente1)

# Adicionar itens ao pedido1
item1 = cardapio.itens[0]
item2 = cardapio.itens[1]
pedido1.adicionar_item(item1)
pedido1.adicionar_item(item2)

# Exibir pedido1
pedido1.exibir_pedido

# Remover item do pedido1
pedido1.remover_item(item1)

# Aplicar desconto de 5% no pedido1
pedido1.aplicar_desconto(0.05 * pedido1.total)

# Exibir pedido1 atualizado

# Criação de um pedido para o cliente2
pedido2 =
