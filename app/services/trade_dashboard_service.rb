class TradeDashboardService
  def initialize(user)
    @user = user
  end

  def call
    trades = @user.trades.order(created_at: :desc)

    total = trades.size

    {
      trades: trades,
      total_trades: total,
      total_profit: total_profit(trades),
      winning_trades: winning_trades(trades),
      win_rate: win_rate(trades, total),
      average_pnl: average_pnl(trades, total),
      chart_labels: chart_labels(trades),
      chart_data: chart_data(trades)
    }
  end

  private

  def total_profit(trades)
    trades.sum('exit_price - entry_price')
  end

  def winning_trades(trades)
    trades.where('exit_price > entry_price').count
  end

  def win_rate(trades, total)
    return 0 if total == 0

    (winning_trades(trades).to_f / total * 100).round(2)
  end

  def average_pnl(trades, total)
    return 0 if total == 0

    (total_profit(trades) / total).round(2)
  end

  def chart_labels(trades)
    trades.map.with_index { |_, i| "Trade #{i + 1}" }
  end

  def chart_data(trades)
    trades.map(&:pnl)
  end
end
