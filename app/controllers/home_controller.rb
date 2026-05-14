class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    result = TradeDashboardService.new(current_user).call
    @trades = result[:trades]
    @total_trades = result[:total_trades]
    @total_profit = result[:total_profit]
    @winning_trades = result[:winning_trades]
    @win_rate = result[:win_rate]
    @average_pnl = result[:average_pnl]
    @chart_labels = result[:chart_labels]
    @chart_data = result[:chart_data]
  end
end
