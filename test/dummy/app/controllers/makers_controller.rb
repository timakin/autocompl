class MakersController < ApplicationController
  before_action :set_maker, only: [:show, :edit, :update, :destroy]

  autocomplete product: :name, maker: [:name_ja, :name_en]

  # GET /makers
  def index
    @makers = Maker.all
  end

  # GET /makers/1
  def show
  end

  # GET /makers/new
  def new
    @maker = Maker.new
  end

  # GET /makers/1/edit
  def edit
  end

  # POST /makers
  def create
    @maker = Maker.new(maker_params)

    if @maker.save
      redirect_to @maker, notice: 'Maker was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /makers/1
  def update
    if @maker.update(maker_params)
      redirect_to @maker, notice: 'Maker was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /makers/1
  def destroy
    @maker.destroy
    redirect_to makers_url, notice: 'Maker was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_maker
    @maker = Maker.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def maker_params
    params.require(:maker).permit(:name_ja, :name_en)
  end
end
