require_relative '../../../lib/services/delete_warehouse'

module Shop
  WAREHOUSE = []
end

RSpec.describe Shop::DeleteWarehouse do
  subject(:warehouse) { Shop::DeleteWarehouse.new }

  describe "#call" do
    context "invalid id" do
      it "raises no error" do
        warehouse.call(nil)
      end
    end

    context "valid id" do
      let(:quantity) { 10 }
      let!(:add_to_warehouse) do
        Shop::WAREHOUSE << Shop::Warehouse.new(1, quantity)
      end
      let(:first_warehouse) { Shop::WAREHOUSE.first }

      it "reduce quantity" do
        expect {
          warehouse.call(first_warehouse.id)
        }.to change{ first_warehouse.quantity }.from(quantity).to(quantity-1)
      end
    end
  end
end
