class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    if @life_points >= 0
      puts "#{@name} a #{@life_points} point(s) de vie"
      
    else 
      puts "#{@name} a #{@life_points} point(s) de vie. Il est MORT !!!"
     
    end
  end

  def gets_damage(damage_recived)
    @life_points -= damage_recived
    if @life_points < 0
      puts "#{@name} à été tué"
      puts "*****"
      puts " "
    end
  end

  def attacks(attacked_player)
    puts "Le joueur #{@name} attaque le joueur #{attacked_player.name}"
    damage_given = compute_damage #on stock le résultat du dé dans la variable "damage given"
    puts "Il lui inflige #{damage_given} points de dommages"
    attacked_player.gets_damage(damage_given) #on applique la methode "damage" au joueur attaqué
    
  end

  def compute_damage
    return rand(1..6)
  end

end