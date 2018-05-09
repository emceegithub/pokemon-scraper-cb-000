class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  
  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    #@hp = pokemon[:hp]
    @db = pokemon[:db]
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
    def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE id = #{id}").flatten[0]
    type = db.execute("SELECT type FROM pokemon WHERE id = #{id}").flatten[0]
    hp = db.execute("SELECT hp FROM pokemon WHERE id = #{id}").flatten[0]
    pokemonhash = {id: id, name: name, type: type, hp: hp, db: db}
    newPokemon = Pokemon.new(pokemonhash)
    return newPokemon
  end

end
