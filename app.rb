require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts " "
puts "Voici l'état de chaque joueur :"
player1.show_state 
player2.show_state 

while player1.life_points > 0 && player2.life_points > 0
  puts "*****"
  puts " "
  puts "Passons à la phase d'attaque :"
  player1.attacks(player2)
  if player2.life_points <= 0
    break  # Sortir de la boucle si player2 est tué
  end

  puts "*****"
  puts " "
  puts "L'autre joueur prend sa revanche !"
  player2.attacks(player1)
    if player1.life_points <= 0
      break
    end

puts "*****"
puts " "
puts "Etat des joueurs à la fin du round :"
player1.show_state 
player2.show_state 


end



binding.pry
