require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "*************************************************"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "*************************************************"
puts " "
puts " "
sleep(2)
puts "Initialisation du joueur:"
puts "Quel est votre nom ? "
print ">"
user_name = gets.chomp

user = HumanPlayer.new("#{user_name}")
puts "******"
puts " "
sleep(1)
puts "Initialisation joueurs :"
sleep(1)
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies_array = [player1, player2]
puts "#{player1.show_state}" 
puts "#{player2.show_state}"
sleep(1)

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  user.show_state 
  puts " "

  user_choice = nil
  while user_choice != 'a' && user_choice != 's' && user_choice != '0' && user_choice != '1'
    puts " "
    puts " -------------------------------"
    puts "QUELLE ACTION VEUX TU EFFECTUER ?"
    puts " "
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts " "
    puts "Attaquer un joueur en vue :"
    puts "0 - #{player1.show_state} "
    puts "1 - #{player2.show_state}"
    puts " -------------------------------"
    print ">"
    user_choice = gets.chomp
  end

  case user_choice
  when "a"
    user.search_weapon
  when "s"
    user.search_health_pack
  when "0"
    user.attacks(player1)
  when "1"
    user.attacks(player2)
  else
    puts "La saisie n'est pas correcte"
    user_choice = gets.chomp
    print ">"
  end


  
  enemies_array.each do |enemy|
    if enemy.life_points > 0
      puts "Les autres joueurs t'attaquent !"
      puts " "
      sleep(1)
      enemy.attacks(user)
    end
  end

  if user.life_points <= 0 || (player1.life_points <= 0 && player2.life_points <= 0)  
    puts "La partie est finie !"
    if user.life_points <= 0 
      puts "Loser ! Tu as perdu !"
    else
      puts "BRAVO ! TU AS GAGNE !"
    end
  end
end
