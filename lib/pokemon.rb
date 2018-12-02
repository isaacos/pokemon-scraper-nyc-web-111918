require 'pry'
class Pokemon

  attr_accessor :name, :type, :db
  attr_reader :id, :hp

  def initialize(id = 10, name = 'Pikachu', type = 'electric', hp = 60, db)
    @id = id
    @name = name
    @type = type
    @db = db
      if name == "Pikachu"
        @hp = 59
      end
    @hp = hp
  end

  def self.save (name,  type, db)
      db.execute("INSERT INTO pokemon  (name, type) VALUES (? , ?);", [name, type])
      #@id = DB[:conn].execture("SELECT * FROM pokemon;").last["id"]
  end

  def self.find (id, db)
    #db.execute()
    answer = db.execute("SELECT * FROM pokemon WHERE pokemon.id = '#{id}'")[0]

    Pokemon.new(answer[0], answer[1], answer[2], db)
  end


end
