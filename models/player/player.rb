require 'pg'

class Player
  attr_accessor(:id, :first_name, :last_name, :age, :position, :team_id, :image, :name)

  #Connect to the database
  def self.open_connection
    connection = PG.connect(dbname: 'sports')
  end

  #Method to get all the blog posts

  def self.all
    connection = self.open_connection

    sql = "SELECT id, first_name, last_name, age, position FROM player ORDER by ID"

    results = connection.exec(sql)


    #return array of post objects

    posts = results.map do |post|
      self.hydrate(post)
    end
    posts
  end

  def self.all_teams
    connection = self.open_connection

    sql = "SELECT id, name, points, position FROM football_team ORDER BY id"

    results = connection.exec(sql)


    #return array of post objects

    teams = results.map do |team|
      self.hydrate(team)
    end
    teams
  end

  def self.find(id)
    connection = self.open_connection

    sql = "SELECT * FROM teams_with_players WHERE id = #{id} LIMIT 1"

    posts = connection.exec(sql)

    post = self.hydrate(posts[0])

    post
  end




  #Passing the PG object through hydration by making an instance within the class
  def self.hydrate(player_data)
    player = Player.new

    player.id = player_data['id']
    player.first_name = player_data['first_name']
    player.last_name = player_data['last_name']
    player.age = player_data['age']
    player.position = player_data['position']
    player.team_id = player_data['team_id']
    player.image = player_data['image']
    player.name = player_data['name']

    player
  end

  def save
    connection = Player.open_connection

    if !self.id
      sql = "INSERT INTO post (first_name, last_name, age, position, team_id, image) VALUES ('#{self.first_name}', '#{self.last_name}', #{self.age}, '#{self.position}', #{self.team_id}, '#{self.image}')"

    else

      sql = "UPDATE post SET first_name = '#{self.first_name}', last_name = '#{self.last_name}', age = #{self.age}, last_name = '#{self.position}' WHERE id = #{self.id}"
    end

    connection.exec(sql)
  end

  def self.destroy id
    connection = self.open_connection

    sql = "DELETE FROM post where id = #{id}"

    connection.exec(sql)
  end




end
