require_relative '../../../lib/services/delete_warehouse'

module Shop
  WAREHOUSE = []
end

RSpec.describe Shop::DeleteWarehouse do
  subject(:warehouse) { Shop::DeleteWarehouse.new }

  before do
    Shop::WAREHOUSE.clear
  end

  describe "#call" do
    context "invalid id" do
      it "raises no error" do
        expect {
          warehouse.call(nil)
        }.to_not raise_error
      end
    end

    context "valid id" do
      let(:quantity) { 10 }
      let!(:add_to_warehouse) { Shop::WAREHOUSE << Shop::Warehouse.new(1, quantity) }
      let(:first_warehouse) { Shop::WAREHOUSE.first }

      it "reduce quantity" do
        expect {
          warehouse.call(first_warehouse.id)
        }.to change{ first_warehouse.quantity }.from(quantity).to(quantity-1)
      end
    end
  end
end
