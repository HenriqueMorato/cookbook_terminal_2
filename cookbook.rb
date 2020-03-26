require 'io/console'
require_relative 'receita'

INSERIR_RECEITA = 1
VISUALIZAR_RECEITA = 2
PESQUISAR_RECEITA = 3
SAIR = 4

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

def insert_recipe(i)
  print 'Digite o nome da sua receita: '
  nome = read_input
  print 'Digite o tipo da receita: '
  tipo = read_input
  print 'Digite o modo de preparo: '
  preparo = read_input
  puts
  puts "Receita #{nome} cadastrada com sucesso!"
  Receita.new(i, nome, preparo, tipo)
end

def imprimir_receitas(receitas)
  puts receitas
end

clear
welcome
opcao = menu

receitas = []
index = 1

while opcao != SAIR
  if opcao == INSERIR_RECEITA
    receitas << insert_recipe(index)
    index += 1
    wait_keypress
    clear
  elsif opcao == VISUALIZAR_RECEITA
    imprimir_receitas(receitas)
    puts 'Nenhuma receita cadastrada' if receitas.empty?
    wait_keypress
    clear
  elsif opcao == PESQUISAR_RECEITA
    print 'Digite o termo que deseja buscar: '
    termo = read_input
    receitas_encontradas = receitas.select do |receita|
      receita.include?(termo)
    end
    if receitas_encontradas.empty?
      puts "Nenhuma receita encontrada" 
    else
      puts "#{receitas_encontradas.size} receita(s) encontrada(s)"
    end
    imprimir_receitas(receitas_encontradas)
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