require_relative './models/item'
require_relative './models/category'

class ItemController
  def create(params)
    item = Item.new(params)
    return false unless item.valid?
    item.save
  end

  def index
    items = Item.get_all
    renderer = ERB.new(File.read('./views/item_list.erb'))
    renderer.result(binding)
  end

  def update(params)
    item = Item.find_by_id(params['id'])
    return false unless item

    item.name = params['name']
    item.price = params['price']
    item.category = params['category']
    item.update

    true
  end

  def delete(params)
    item = Item.find_by_id(params['id'])
    return false unless item

    item.delete
  end

  def show(params)
    item = Item.new({
      id: params['id'],
      name: params['name'],
      price: params['price'],
      category: params['category']}
    )
    return false unless item.valid?
    categories = Category.get_all
    renderer = ERB.new(File.read('./views/item_update.erb'))
    renderer.result(binding)
  end

  def add
    categories = Category.get_all
    renderer = ERB.new(File.read('./views/item_form.erb'))
    renderer.result(binding)
  end
end