class Player
  attr_accessor :name, :life_points

  def initialize(name, life_points = 10)
    @name = name
    @life_points = life_points
  end

  def show_state
    if @life_points >= 0
      return "#{@name} a #{@life_points} point(s) de vie"
      
    else 
      return "#{@name} a #{@life_points} point(s) de vie. Ce joueur est MORT !!!"
     
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
    puts " "
    attacked_player.gets_damage(damage_given) #on applique la methode "damage" au joueur attaqué
    sleep(1)
    
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name, life_points=50)
    @weapon_level = 1
    super(name, life_points) #fait appel au initialize de la classe Event
  end

  def show_state
    puts "#{@name} a #{@life_points} point(s) de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..6) 
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      @weapon_level = new_weapon_level
    else 
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def new_life_points(points) #methode mettre à jour le nouveau niveau de vie (mais plafonné à 100)
    #cette methode sera utilisée lors de l'utilisation de le search weapon
    @life_points += points
    @life_points = 100 if @life_points > 100
  end

  def search_health_pack
    health_pack_level = rand (1..6)
    if health_pack_level == 1
      puts "Tu n'as rien trouvé... "
    elsif (2..5).include?(health_pack_level)
      new_life_points(50)
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      puts "Tu as mainenant #{@life_points} points de vie !"
    elsif health_pack_level == 6
      new_life_points(80)
      puts "Bravo, tu as trouvé un pack de +80 points de vie !"
      puts "Tu as mainenant #{@life_points} points de vie !"
    end
  end


  
end