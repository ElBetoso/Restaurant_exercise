class DishesController < ApplicationController
  skip_before_action :protect_pages, only: [:index, :show]
  before_action :set_dish, only: %i[ show edit update destroy ]

  # GET /dishes or /dishes.json
  def index
    @dishes = Dish.all.load_async
    @dish_group = DishGroup.all.order(name: :asc).load_async
    @restaurant = Restaurant.all.order(name: :asc).load_async
    @dishes = Dish.with_attached_photo.order(created_at: :desc).load_async
    if params[:dish_group_id]
      @dishes = @dishes.where(dish_group_id: params[:dish_group_id])
    end
    if params[:restaurant_id]
      @dishes = @dishes.where(restaurant_id: params[:restaurant_id])
    end
  end

  # GET /dishes/1 or /dishes/1.json
  def show
  end

  # GET /dishes/new
  def new
    @dish = Dish.new
  end

  # GET /dishes/1/edit
  def edit
  end

  # POST /dishes or /dishes.json
  def create
    @dish = Dish.new(dish_params)

    respond_to do |format|
      if @dish.save
        format.html { redirect_to dish_url(@dish), notice: "Dish was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes/1 or /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to dish_url(@dish), notice: "Dish was successfully updated." }
        format.json { render :show, status: :ok, location: @dish }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1 or /dishes/1.json
  def destroy
    @dish.destroy

    respond_to do |format|
      format.html { redirect_to dishes_url, notice: "Dish was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dish_params
      params.require(:dish).permit(:name, :description, :price,:dish_group_id, :restaurant_id, :photo)
    end
end
