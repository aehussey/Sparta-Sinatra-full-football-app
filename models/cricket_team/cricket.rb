require 'pg'

class Cricket
  attr_accessor(:id, :name, :points, :position, :image)

  #Connect to the database
  def self.open_connection
    connection = PG.connect(dbname: 'sports')
  end

  #Method to get all the blog posts

  def self.all
    connection = self.open_connection

    sql = "SELECT * FROM cricket_team ORDER by ID"

    results = connection.exec(sql)


    #return array of post objects

    teams = results.map do |team|
      self.hydrate(team)
    end
    teams
  end

  def self.find(id)
    connection = self.open_connection

    sql = "SELECT * FROM cricket_team WHERE id = #{id} LIMIT 1"

    teams = connection.exec(sql)

    team = self.hydrate(teams[0])

    team
  end




  #Passing the PG object through hydration by making an instance within the class
  def self.hydrate(team_data)
    team = Cricket.new

    team.id = team_data['id']
    team.name = team_data['name']
    team.points = team_data[points]
    team.position = team_data['position']
    team.image = team_data['image']

    post
  end

  def save
    connection = Cricket.open_connection

    if !self.id
      sql = "INSERT INTO cricket_team (name, points, position, image) VALUES ('#{self.name}', #{self.points}, '#{self.position}', '#{self.image}')"

    else

      sql = "UPDATE cricket_team SET name = '#{self.name}', points = #{self.points}, position = '#{self.position}', image = '#{self.image}' WHERE id = #{self.id}"
    end

    connection.exec(sql)
  end

  def self.destroy id
    connection = self.open_connection

    sql = "DELETE FROM cricket_team where id = #{id}"

    connection.exec(sql)
  end




end

# puts Post.all
