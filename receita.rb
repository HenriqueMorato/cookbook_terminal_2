class Receita
  attr_reader :tipo_da_receita
  attr_accessor :index, :nome, :modo_de_preparo

  @@receitas = []

  def initialize(index = nil, nome, modo_de_preparo, tipo_da_receita)
    @index = index
    @nome = nome
    @modo_de_preparo = modo_de_preparo
    @tipo_da_receita = tipo_da_receita
  end

  def to_s
    "#{index} - #{nome} - #{tipo_da_receita}\n\s\s#{modo_de_preparo}"
  end

  def include?(termo, case_sensitive = false)
    if case_sensitive
      nome.include?(termo)
    else
      nome.downcase.include?(termo.downcase)
    end
  end

  def salvar
    self.index = Receita.todas.any? ? Receita.todas.last.index + 1 : 1
    Receita.todas << self
  end

  def self.buscar(termo)
    receitas_encontradas = todas.select do |receita|
      receita.include?(termo)
    end
    # Guard Clause
    return puts "Nenhuma receita encontrada" if receitas_encontradas.empty?

    puts "#{receitas_encontradas.size} receita(s) encontrada(s)"
    puts receitas_encontradas
  end

  def self.todas
    @@receitas
  end
end