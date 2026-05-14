class TradesController < ApplicationController
  before_action :set_trade, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /trades or /trades.json
  def index
    @trades = current_user.trades.order(created_at: :desc)
  end

  # GET /trades/1 or /trades/1.json
  def show; end

  # GET /trades/new
  def new
    @trade = Trade.new
  end

  # GET /trades/1/edit
  def edit; end

  # POST /trades or /trades.json
  def create
    @trade = current_user.trades.new(trade_params)

    respond_to do |format|
      if @trade.save
        format.html { redirect_to @trade, notice: 'Trade was successfully created.' }
        format.json { render :show, status: :created, location: @trade }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @trade.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /trades/1 or /trades/1.json
  def update
    respond_to do |format|
      if @trade.update(trade_params)
        format.html { redirect_to @trade, notice: 'Trade was successfully updated.', status: :see_other }
        format.json { render :show, status: :ok, location: @trade }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @trade.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /trades/1 or /trades/1.json
  def destroy
    @trade.destroy!

    respond_to do |format|
      format.html { redirect_to trades_path, notice: 'Trade was successfully destroyed.', status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_trade
    @trade = Trade.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def trade_params
    params.require(:trade).permit(:symbol, :entry_price, :exit_price, :note)
  end
end
