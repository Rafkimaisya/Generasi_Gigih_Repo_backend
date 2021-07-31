require_relative './models/item'

class CategoryController
  def create(params)
    category = Category.new(params)
    return false unless category.valid?
    category.save
  end



  def index
    categories = Category.get_all
    renderer = ERB.new(File.read('./views/category_list.erb'))
    renderer.result(binding)
  end



  def add
    renderer = ERB.new(File.read('./views/category_form.erb'))
    renderer.result(binding)
  end



  def update(params)
    category = Category.find_by_id(params['id'])
    return false unless category

    category.name = params['name']
    category.update

    true
  end



  def delete(params)
    category = Category.find_by_id(params['id'])
    return false unless category
    category.delete
  end




  def show(params)
    category = Category.new({
      "id": params['id'],
      "name": params['name']
    })
    return false unless category.valid?
    items = Item.find_by_category(params['id'])


    
    renderer = ERB.new(File.read('./views/category.erb'))
    renderer.result(binding)
  end
end