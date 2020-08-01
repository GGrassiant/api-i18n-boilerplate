require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe 'GET index' do
    context 'request to index is successful' do
      let(:items) { assigns :items }
      before(:each) do
        Item.create!(name: 'test_item', description: 'text_item_description')
        get :index, format: JSON
      end
      it { expect(items.to_a.length).to be(1) }
    end
  end

  describe 'GET show' do
    context 'request to show is successful' do
      before(:each) do
        item = Item.create!(name: 'test_item', description: 'text_item_description')
        get :show, params: { id: item.id }, format: JSON
      end
      it { expect(response).to have_http_status(:success) }
    end
  end

  describe 'Delete item' do
    context 'deleting item is successful' do
      before(:each) do
        item = Item.create!(name: 'test_item', description: 'text_item_description')
        get :destroy, params: { id: item.id }, format: JSON
      end
      it { expect(response).to have_http_status(:success) }
    end
  end

  describe 'Create item' do
    context 'creating item is successful' do
      before(:each) do
        get :create, params: { name: 'test_item', description: 'text_item_description' }, format: JSON
      end
      it { expect(response).to have_http_status(:success) }
    end

    context 'creating multilingual item is successful' do
      before(:each) do
        get :create, params: {
          name: 'test_item',
          description: 'text_item_description',
          name_fr: 'element test',
          description_fr: 'element de test description',
          name_ar: 'البند 4',
          description_ar: 'وصف البند 4'
        }, format: JSON
      end
      it { expect(response).to have_http_status(:success) }
    end
  end

  describe 'Update item' do
    context 'updating item is successful' do
      before(:each) do
        item = Item.create!(name: 'test_item', description: 'text_item_description')
        get :update, params: { id: item.id, name: 'test_item_modified', description: 'text_item_description_modified' },
                     format: JSON
      end
      it { expect(response).to have_http_status(:success) }
    end
  end
end
