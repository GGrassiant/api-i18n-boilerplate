# frozen_string_literal: true

# Controller to handle routes and methods for Items
class Api::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_item, only: %i[show update destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def create
    @item = Item.new

    if params['name']
      @item.attributes = {
        name: params['name'],
        description: params['description'],
        locale: :en
      }
    end

    if params['name_fr']
      @item.attributes = {
        name: params['name_fr'],
        description: params['description_fr'],
        locale: :fr
      }
    end

    if params['name_ar']
      @item.attributes = {
        name: params['name_ar'],
        description: params['description_ar'],
        locale: :ar
      }
    end

    if @item.save!
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @item.update!(item_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @item.destroy!
    head :no_content, status: :ok
  end

  def show; end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.permit(:id, :name, :description, :name_fr, :name_ar, :description_fr, :description_ar)
  end

  def render_error
    render json: { errors: @item.errors.full_messages },
           status: :unprocessable_entity
  end
end
