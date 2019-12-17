class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @images = @item.images.build
  end

  def create
    # @item = Item.new(item_params)
    # if @item.save
    #   params[:image]['image_url'].each do |a|
    #     @image = @item.images.create!(image_url: a)
    #   end
    #   redirect_to root_path, notice: '出品しました。'

    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path  #仮置き
      # notice: 'Event was successfully created.'
    else
      @item.images.build
      render :new
    end
    
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  
  
  
  private
  def set_item
    @item = Item.find(params[:id])
  end
  
  def  item_params
    params.require(:item).permit(
      :name,
      :description,
      :category_id,
      :size_id,
      :brand_id,
      :condition_id,
      :prefecture_id,
      :sendingmethod_id,
      :postageburden_id,
      :shippingday_id,
      :price,
      images_attributes: [:image_url]).merge(seller_id: current_user.id,)
  end
end