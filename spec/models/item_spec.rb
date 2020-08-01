require 'rails_helper'

RSpec.describe Item, type: :model do

  context 'Create valid item' do
    attributes = {
      "name": 'Item 1',
      "description": 'Description for item 1'
    }
    let(:item) { Item.create attributes }

    it { expect(item).to be_valid }
  end

  context 'Create an invalid item' do
    attributes1 = {
      "description": 'Description for item 1'
    }
    attributes2 = {
      "name": 'Item 1'
    }
    let(:item1) { Item.create attributes1 }
    let(:item2) { Item.create attributes2 }

    it { expect(item1).not_to be_valid }
    it { expect(item2).not_to be_valid }
  end
end
