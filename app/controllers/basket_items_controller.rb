class BasketItemsController < ApplicationController
  before_action :set_basket_item, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /basket_items or /basket_items.json
  def index
    @basket_items = current_user.basket_items
  end

  # GET /basket_items/1 or /basket_items/1.json
  def show
  end

  # GET /basket_items/new
  def new
    @basket_item = BasketItem.new
  end

  # GET /basket_items/1/edit
  def edit
  end

  # POST /basket_items or /basket_items.json
  def create
    @basket_item = BasketItem.new(basket_item_params)

    respond_to do |format|
      if @basket_item.save
        format.html { redirect_to @basket_item, notice: "Basket item was successfully created." }
        format.json { render :show, status: :created, location: @basket_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @basket_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /basket_items/1 or /basket_items/1.json
  def update
    respond_to do |format|
      if @basket_item.update(basket_item_params)
        format.html { redirect_to @basket_item, notice: "Basket item was successfully updated." }
        format.json { render :show, status: :ok, location: @basket_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @basket_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basket_items/1 or /basket_items/1.json
  def destroy
    @basket_item.destroy!

    respond_to do |format|
      format.html { redirect_to basket_items_path, status: :see_other, notice: "Basket item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basket_item
      @basket_item = BasketItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def basket_item_params
      params.require(:basket_item).permit(:user_id, :keyboard_item_id)
    end
end
