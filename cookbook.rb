require 'io/console'
require_relative 'receita'

INSERIR_RECEITA = 1
VISUALIZAR_RECEITA = 2
PESQUISAR_RECEITA = 3
APAGAR_RECEITA = 4
SAIR = 5

def welcome
  puts 'Bem-vindo ao My Cookbook, sua rede social de receitas culinárias!'
end

def clear
  system('clear')
  puts
end

def menu
  puts "[#{INSERIR_RECEITA}] Cadastrar uma receita"
  puts "[#{VISUALIZAR_RECEITA}] Ver todas as receitas"
  puts "[#{PESQUISAR_RECEITA}] Pesquisar uma receita"
  puts "[#{APAGAR_RECEITA}] Apagar uma receita"
  puts "[#{SAIR}] Sair"

  print 'Escolha uma opção: '
  gets.to_i
end

def wait_keypress
  puts
  puts 'Pressione alguma tecla para continuar'
  STDIN.getch
end

def read_input
  gets.chomp
end

def insert_recipe
  print 'Digite o nome da sua receita: '
  nome = read_input
  print 'Digite o tipo da receita: '
  tipo = read_input
  print 'Digite o modo de preparo: '
  preparo = read_input
  puts
  puts "Receita #{nome} cadastrada com sucesso!"
  Receita.new(nil, nome, preparo, tipo)
end

def imprimir_receitas
  puts Receita.todas
end

clear
welcome
opcao = menu

while opcao != SAIR
  if opcao == INSERIR_RECEITA
    receita = insert_recipe
    receita.salvar
    wait_keypress
    clear
  elsif opcao == VISUALIZAR_RECEITA
    imprimir_receitas
    puts 'Nenhuma receita cadastrada' if Receita.todas.empty?
    wait_keypress
    clear
  elsif opcao == PESQUISAR_RECEITA
    print 'Digite o termo que deseja buscar: '
    termo = read_input
    Receita.buscar(termo)
    wait_keypress
    clear
  elsif opcao == APAGAR_RECEITA
    imprimir_receitas
    puts
    print 'Digite o número da receita que deseja apagar: '
    numero = gets.to_i - 1
    puts "Receita #{Receita.todas[numero].nome} apagada com sucesso!"
    Receita.todas.delete_at(numero)
    wait_keypress
    clear
  else
    puts 'Opção inválida'
    wait_keypress
    clear
  end

  opcao = menu
end

puts 'Obrigado por usar o Cookbook'