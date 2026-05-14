json.extract! trade, :id, :symbol, :entry_price, :profit, :note, :created_at, :updated_at
json.url trade_url(trade, format: :json)
