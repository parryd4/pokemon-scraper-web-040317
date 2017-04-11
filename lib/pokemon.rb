require 'pry'

class Pokemon
  @@all = []

  attr_reader :id, :name, :type, :db, :hp

  def initialize(name:, type:, db:, id:, hp: 60)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, database)
    database.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, database)
    array = database.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    #binding.pry
    Pokemon.new(id: id,name: array[1],type: array[2], db: database, hp: array[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, @id)

#    binding.pry
  end

end
