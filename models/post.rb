require 'pg'

class Post
  attr_accessor(:id, :title, :body)

  #Connect to the database
  def self.open_connection
    connection = PG.connect(dbname: 'blog')
  end

  #Method to get all the blog posts

  def self.all
    connection = self.open_connection

    sql = "SELECT id, title, body FROM post ORDER by ID"

    results = connection.exec(sql)


    #return array of post objects

    posts = results.map do |post|
      self.hydrate(post)
    end
    posts
  end

  def self.find(id)
    connection = self.open_connection

    sql = "SELECT * FROM post WHERE id = #{id} LIMIT 1"

    posts = connection.exec(sql)

    post = self.hydrate(posts[0])

    post
  end




  #Passing the PG object through hydration by making an instance within the class
  def self.hydrate(post_data)
    post = Post.new

    post.id = post_data['id']
    post.title = post_data['title']
    post.body = post_data['body']

    post
  end

  def save
    connection = Post.open_connection

    if !self.id
      sql = "INSERT INTO post (title, body) VALUES ('#{self.title}', '#{self.body}')"

    else

      sql = "UPDATE post SET title = '#{self.title}', body = '#{self.body}' WHERE id = #{self.id}"
    end

    connection.exec(sql)
  end

  def self.destroy id
    connection = self.open_connection

    sql = "DELETE FROM post where id = #{id}"

    connection.exec(sql)
  end




end

# puts Post.all
