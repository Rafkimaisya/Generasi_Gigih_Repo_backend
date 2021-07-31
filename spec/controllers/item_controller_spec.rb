require_relative '././db/mysql_connector'
require_relative '././controllers/item_controller'
require_relative '././models/item'
require_relative '././models/category'

describe ItemController do
    describe "#create" do
        context " valid parameter" do
            it "  new item" do
                stub = double
                
                controller = ItemController.new
                params = {
                    "id"=> 1,
                    "name"=> "nasi",
                    "price"=> 5000,
                    "category"=>3
                }
    
                expect(Item).to receive(:new).with(params).and_return(stub)
                expect(stub).to receive(:valid?).and_return(true)
                expect(stub).to receive(:save)
    
                controller.create(params)

                expect(Item).to receive(:find_by_id).with(1).and_return(stub)
                result_item = Item.find_by_id(1)
                expect(result_item).not_to be_nil
            end
        end

        context " invalid parameter" do
            it " return false" do
                stub = double
                
                controller = ItemController.new
                params = {
                    "id"=> 1,
                    "name"=> "nasi",
                    "price"=> 5000,
                    "category"=>3
                }
    
                expect(Item).to receive(:new).with(params).and_return(stub)
                expect(stub).to receive(:valid?).and_return(nil)
    
                result = controller.create(params)

                expect(result).to eq(false)
            end
        end
    end

    describe "#index" do
        context " valid parameter" do
            it " show all item" do
                controller = ItemController.new

                allow(Item).to receive(:get_all).and_return([])
                allow(Item).to receive(:get_all).and_return([])

                result = controller.index
                items = Item.get_all
                expected_view = ERB.new(File.read('././views/item_list.erb')).result(binding)

                expect(result).to eq(expected_view)
            end
        end
    end
end