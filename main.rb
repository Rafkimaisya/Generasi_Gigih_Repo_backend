require 'sinatra'
require_relative './controllers/item_controller'
require_relative './controllers/category_controller'


get '/items' do
  controller = ItemController.new
  controller.index
end

get '/items/add' do
  controller = ItemController.new
  controller.add
end

post '/items/show' do
  controller = ItemController.new
  controller.show(params)
end

post '/items/delete' do
  controller = ItemController.new
  controller.delete(params)
end

post '/items' do
  controller = ItemController.new
  controller.create(params)
end

post '/items/update' do
  controller = ItemController.new
  controller.update(params)
end

get '/categories' do
  controller = CategoryController.new
  controller.index
end

get '/categories/add' do
  controller = CategoryController.new
  controller.add
end

post '/categories/show' do
  controller = CategoryController.new
  controller.show(params)
end

post '/categories/delete' do
  controller = CategoryController.new
  controller.delete(params)
end

post '/categories' do
  controller = CategoryController.new
  controller.create(params)
end

post '/categories/update' do
  controller = CategoryController.new
  controller.update(params)
end