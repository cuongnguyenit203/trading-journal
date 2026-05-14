class CreateTrades < ActiveRecord::Migration[7.1]
  def change
    create_table :trades do |t|
      t.string :symbol
      t.decimal :entry_price
      t.decimal :profit
      t.text :note

      t.timestamps
    end
  end
end
