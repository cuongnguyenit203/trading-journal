class HomeController < ApplicationController
  before_action :authenticate_user! 
  def index
    @trades = current_user.trades.order(created_at: :desc)
    @total_trades = @trades.count
    @total_profit = @trades.sum(&:pnl)
    @winning_trades = @trades.select { |trade| trade.pnl > 0 }.count
    @win_rate = @total_trades > 0 ? (@winning_trades.to_f / @total_trades * 100).round(2) : 0
    @average_pnl = @total_trades > 0 ? (@total_profit / @total_trades).round(2) : 0

    @chart_labels = @trades.map.with_index { |trade, index| "Trade #{index + 1}" }
    @chart_data = @trades.map(&:pnl)
  end
end
