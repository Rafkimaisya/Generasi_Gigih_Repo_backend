require_relative '././db/mysql_connector'
require_relative '././controllers/category_controller'
require_relative '././models/item'
require_relative '././models/category'

describe CategoryController do
    describe "#create" do
        context " valid parameter" do
            it " new category" do
                stub = double
                
                controller = CategoryController.new
                params = {
                    "id"=> 3,
                    "name"=> "nasi"
                }
                category = Category.new(params)
    
                expect(Category).to receive(:new).with(params).and_return(stub)
                expect(stub).to receive(:valid?).and_return(true)
                expect(stub).to receive(:save)
                expect(Category).to receive(:find_by_id).with(1).and_return(category)
    
                controller.create(params)

                result = Category.find_by_id(1)
                expect(result).not_to be_nil
            end
        end

        context " invalid parameter" do
            it " return false" do
                stub = double
                
                controller = CategoryController.new
                params = {
                    "id"=> 3
                }
                category = Category.new(params)
    
                expect(Category).to receive(:new).with(params).and_return(stub)
                expect(stub).to receive(:valid?).and_return(false)
    
                result = controller.create(params)

                expect(result).to eq(false)
            end
        end
    end

    describe "#index" do
        context " valid parameter" do
            it " show all category" do
                controller = CategoryController.new

                expect(Category).to receive(:get_all).and_return([])
                expect(Category).to receive(:get_all).and_return([])

                result = controller.index
                categories = Category.get_all
                expected_view = ERB.new(File.read('././views/category_list.erb')).result(binding)

                expect(result).to eq(expected_view)
            end
        end
    end
end