class BuysController < ApplicationController
before_action :set_item

  def index
    @address_form = AddressForm.new
  end

  def create
    @buy = Buy.new
    @address_form = AddressForm.new(address_params)
    if @address_form.valid?
      @address_form.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end
  
  private

    def address_params
    params.require(:address_form).permit(:postal_code,:prefecture_id,:city,:block,:buildings_name,:phone_number).merge(user_id: current_user.id,item_id:params[:item_id])
    end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
