require_relative './db/mysql_connector'
require_relative '././models/category'

describe Category do
  describe 'valid?' do
    context 'given valid parameter' do
      it 'should return true' do
        category = Category.new({
                                  id: 3,
                                  name: 'nasi'
                                })
        expect(category.valid?).to eq(true)
      end
    end

    context 'invalid parameter' do
      it ' return false ' do
        category = Category.new({ id: 3 })
        expect(category.valid?).to eq(false)
      end
    end
  end

  describe 'update' do
    context ' execute' do
      it ' change data' do
        stub_client = double
        stub_query1 = 'UPDATE categories SET name=nasi WHERE id = 3'
        category = Category.new({
                                  id: 3,
                                  name: 'nasi'
                                })
        allow(Mysql2::Client).to receive(:new).and_return(stub_client)
        expect(stub_client).to receive(:query).with(stub_query_1)
        category.update
      end
    end
  end

  describe 'save' do
    context ' execute' do
      it ' save data' do
        stub_client = double
        stub_query = 'INSERT INTO categories (name) VALUES (nasi)'
        category = Category.new({
                                  id: 3,
                                  name: 'nasi'
                                })
        allow(Mysql2::Client).to receive(:new).and_return(stub_client)
        expect(stub_client).to receive(:query).with(stub_query)
        category.save
      end
    end
  end

  describe 'delete' do
    context ' execute' do
      it ' delete data' do
        stub_client = double
        stub_query = 'UPDATE item_categories SET category_id=3 WHERE category_id = 3'
        stub_query_2 = 'DELETE FROM categories WHERE id = 3'
        category = Category.new({
                                  id: 3,
                                  name: 'nasi'
                                })
        allow(Mysql2::Client).to receive(:new).and_return(stub_client)
        expect(stub_client).to receive(:query).with(stub_query)
        expect(stub_client).to receive(:query).with(stub_query_2)
        category.delete
      end
    end
  end
end
 