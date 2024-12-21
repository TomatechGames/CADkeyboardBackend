class BasketItemsController < ApplicationController
  before_action :set_basket_item, only: %i[ show destroy ]
  before_action :authenticate_user!

  # GET /basket_items or /basket_items.json
  def index
    @keyboard_items = current_user.basket_items.collect { |basket_item| basket_item.keyboard_item }
  end

  # GET /basket_items/1 or /basket_items/1.json
  def show
  end

  def purchase_all
    purchased_items=0
    failed_items=0
    current_user.basket_items.each do |basket_item|
      keyboard_item = basket_item.keyboard_item
      if keyboard_item.amount >= 1
        keyboard_item.amount -= 1
        keyboard_item.save
        basket_item.destroy!
        purchased_items += 1
      else
        failed_items += 1
      end
    end

    if failed_items == 0
      respond_to do |format|
        format.html { redirect_to basket_items_path, status: :see_other, notice: "Purchased all ("+purchased_items.to_s+") items." }
        format.json { head :no_content }
      end
    elsif purchased_items > 0
      respond_to do |format|
        format.html { redirect_to basket_items_path, status: :see_other, notice: "Purchased "+purchased_items.to_s+" items.", alert: "Failed to purchase "+failed_items.to_s+" items." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to basket_items_path, status: :see_other, alert: "Failed to purchase all ("+failed_items.to_s+") items." }
        format.json { head :no_content }
      end
    end
  end

  # POST /basket_items or /basket_items.json
  def create
    filtered_params = basket_item_params
    @basket_item = BasketItem.new(filtered_params)
    @basket_item.user = current_user

    @keyboard_item = KeyboardItem.find(filtered_params[:keyboard_item_id])
    if @keyboard_item == nil
      respond_to do |format|
        format.html { redirect_to keyboard_items_path, status: :precondition_failed, alert: "Keyboard item does not exist." }
        format.json { head :no_content, status: :precondition_failed }
        return
      end
    end

    respond_to do |format|
      if @basket_item.save
        format.html { redirect_to @keyboard_item, notice: "Item added to basket." }
        format.json { render :show, status: :created, location: @basket_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @basket_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basket_items/1 or /basket_items/1.json
  def destroy
    if @basket_item == nil
      respond_to do |format|
        format.html { redirect_to basket_items_path, status: :precondition_failed, alert: "Item does not exist in basket." }
        format.json { head :no_content, status: :precondition_failed }
        return
      end
    end

    if @basket_item.user == current_user
      keyboard_item = @basket_item.keyboard_item
      @basket_item.destroy!

      respond_to do |format|
        format.html { redirect_to keyboard_item, status: :see_other, notice: "Item removed from basket." }
        format.json { head :no_content }
      end

      return
    end

    respond_to do |format|
      format.html { redirect_to basket_items_path, status: :precondition_failed, alert: "Item does not exist in basket." }
      format.json { head :no_content, status: :precondition_failed }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basket_item
      @basket_item = BasketItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def basket_item_params
      params.require(:basket_item).permit(:keyboard_item_id)
    end
end
