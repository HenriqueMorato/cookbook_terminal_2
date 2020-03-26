class Receita
  attr_reader :index, :tipo_da_receita
  attr_accessor :nome, :modo_de_preparo

  def initialize(index, nome, modo_de_preparo, tipo_da_receita)
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
end