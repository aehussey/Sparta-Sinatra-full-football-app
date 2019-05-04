require 'pg'

class Football
  attr_accessor(:id, :name, :points, :position, :image)

  #Connect to the database
  def self.open_connection
    connection = PG.connect(dbname: 'sports')
  end

  #Method to get all the blog posts

  def self.all
    connection = self.open_connection

    sql = "SELECT * FROM football_team ORDER by ID"

    results = connection.exec(sql)


    #return array of post objects

    teams = results.map do |team|
      self.hydrate(team)
    end
    teams
  end

  def self.find(id)
    connection = self.open_connection

    sql = "SELECT * FROM football_team WHERE id = #{id} LIMIT 1"

    teams = connection.exec(sql)

    team = self.hydrate(teams[0])

    team
  end




  #Passing the PG object through hydration by making an instance within the class
  def self.hydrate(team_data)
    team = Football.new

    team.id = team_data['id']
    team.name = team_data['name']
    team.points = team_data[points]
    team.position = team_data['position']
    team.image = team_data['image']

    team
  end

  def save
    connection = Football.open_connection

    if !self.id
      sql = "INSERT INTO football_team (name, points, position, image) VALUES ('#{self.name}', #{self.points}, '#{self.position}', '#{self.image}')"

    else

      sql = "UPDATE football_team SET name = '#{self.name}', points = #{self.points}, position = '#{self.position}', image = '#{self.image}' WHERE id = #{self.id}"
    end

    connection.exec(sql)
  end

  def self.destroy id
    connection = self.open_connection

    sql = "DELETE FROM football_team where id = #{id}"

    connection.exec(sql)
  end




end

# puts Post.all
