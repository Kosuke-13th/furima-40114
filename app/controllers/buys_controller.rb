class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @address_form = AddressForm.new
  end

  def create
    @buy = Buy.new
    @address_form = AddressForm.new(address_params)
    if @address_form.valid?
      pay_item
      @address_form.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.require(:address_form).permit(:postal_code, :prefecture_id, :city, :block, :buildings_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: address_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    return unless @item.user_id == current_user.id || @item.buy.present?

    redirect_to root_path
  end
end
