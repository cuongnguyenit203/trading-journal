class AddExitPriceToTrades < ActiveRecord::Migration[7.1]
  def change
    add_column :trades, :exit_price, :decimal
  end
end
