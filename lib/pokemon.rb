class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []
  
  def initialize(id:, name:, type:, db:,hp: 60)
    self.id = id
    self.name = name 
    self.type = type
    self.db = db
    self.hp = hp
    @@all << self
  end
  
  def self.save(name, type, db)
    #binding.pry
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name, type)
  end
  
  def self.find(pokemon_id ,db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = ?",pokemon_id)
    #binding.pry
    self.new(id: poke[0][0], name: poke[0][1], type: poke[0][2], db: db)
  end
  
  def self.all 
    @@all
  end
  
  def alter_hp(amount, db)
    self.hp = amount
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",amount, self.id)
    binding.pry
  end
  
end
