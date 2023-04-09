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
  attr_accessor :itens, :total

  def initialize
    @itens = []
    @total = 0.0
  end

  def adicionar_item(item)
    @itens << item
    @total += item.preco
  end

  def remover_item(item)
    @itens.delete(item)
    @total -= item.preco
  end

  def exibir_pedido
    puts "Pedido:"
    @itens.each { |item| puts "- #{item}" }
    puts "Total: R$#{total}"
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

# Criação do cardápio
cardapio = Cardapio.new

# Adicionar itens ao cardápio
cardapio.adicionar_item("Hambúrguer", 10.0)
cardapio.adicionar_item("Pizza", 20.0)
cardapio.adicionar_item("Refrigerante", 5.0)

# Exibir cardápio
cardapio.exibir_cardapio

# Criação de um pedido
pedido = Pedido.new

# Adicionar itens ao pedido
item1 = cardapio.itens[0]
item2 = cardapio.itens[1]
pedido.adicionar_item(item1)
pedido.adicionar_item(item2)

# Exibir pedido
pedido.exibir_pedido

# Remover item do pedido
pedido.remover_item(item1)

# Exibir pedido atualizado
pedido.exibir_pedido
