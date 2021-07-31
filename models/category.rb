require_relative './db/mysql_connector'

class Category
  attr_accessor :id, :name

  def initialize(params)
    @id = params[:id]
    @name = params[:name]
  end

  def save
    client = create_db_client
    
    client.query("INSERT INTO categories (name) VALUES (#{@name})")
  end

  def self.get_all
    @client = create_db_client
    rawData = @client.query('SELECT * from categories')
    categories = []
    rawData.each do |data|
      category = Category.new({ "id": data['id'], "name": data['name'] })
      categories.push(category)
    end
    categories
  end

  def self.find_by_id(id)
    client = create_db_client
    
    result = client.query("select * from categories where id = #{id}")
    return nil unless result.count.positive?

    data = result.first
    Category.new({ "id": data['id'], "name": data['name'] })
  end

  def update
    client = create_db_client
    client.query("UPDATE categories SET name=#{@name} WHERE id = #{@id}")
  end

  def delete
    client = create_db_client
    client.query("UPDATE item_categories SET category_id=1 WHERE category_id = #{@id}")
    client.query("DELETE FROM categories WHERE id = #{@id}")
  end

  def valid?
    return false if name.nil?

    true
  end
end