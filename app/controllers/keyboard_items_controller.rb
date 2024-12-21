class KeyboardItemsController < ApplicationController
  before_action :set_keyboard_item, only: %i[ show edit update destroy ]

  # GET /keyboard_items or /keyboard_items.json
  def index
    @keyboard_items = KeyboardItem.all
  end

  # GET /keyboard_items/1 or /keyboard_items/1.json
  def show
  end

  # GET /keyboard_items/new
  def new
    unless user_signed_in? && current_user.admin?
      respond_to do |format|
        format.html { redirect_to keyboard_items_path, status: :see_other, alert: "Invalid permission." }
      end
    end
    @keyboard_item = KeyboardItem.new
  end

  # GET /keyboard_items/1/edit
  def edit
    unless user_signed_in? && current_user.admin?
      respond_to do |format|
        format.html { redirect_to @keyboard_item, status: :see_other, alert: "Invalid permission." }
      end
    end
  end

  # POST /keyboard_items or /keyboard_items.json
  def create
    unless user_signed_in? && current_user.admin?
      respond_to do |format|
        format.html { redirect_to keyboard_items_path, status: :see_other, alert: "Invalid permission." }
        format.json { head :no_content, status: :see_other }
      end
      return
    end

    @keyboard_item = KeyboardItem.new(keyboard_item_params)

    respond_to do |format|
      if @keyboard_item.save
        format.html { redirect_to @keyboard_item, notice: "Keyboard item was successfully created." }
        format.json { render :show, status: :created, location: @keyboard_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @keyboard_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keyboard_items/1 or /keyboard_items/1.json
  def update
    unless user_signed_in? && current_user.admin?
      respond_to do |format|
        format.html { redirect_to @keyboard_item, status: :see_other, alert: "Invalid permission." }
        format.json { head :no_content, status: :see_other }
      end
      return
    end

    respond_to do |format|
      if @keyboard_item.update(keyboard_item_params)
        format.html { redirect_to @keyboard_item, notice: "Keyboard item was successfully updated." }
        format.json { render :show, status: :ok, location: @keyboard_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @keyboard_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keyboard_items/1 or /keyboard_items/1.json
  def destroy
    unless user_signed_in? && current_user.admin?
      respond_to do |format|
        format.html { redirect_to @keyboard_item, status: :see_other, alert: "Invalid permission." }
        format.json { head :no_content, status: :see_other }
      end
      return
    end
    @keyboard_item.destroy!

    respond_to do |format|
      format.html { redirect_to keyboard_items_path, status: :see_other, notice: "Keyboard item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keyboard_item
      @keyboard_item = KeyboardItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def keyboard_item_params
      params.require(:keyboard_item).permit(:name, :description, :manufacturer, :amount, :price)
    end
end
