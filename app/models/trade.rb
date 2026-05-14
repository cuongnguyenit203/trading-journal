class Trade < ApplicationRecord
    belongs_to :user    

    validates :symbol, presence: true
    validates :entry_price, presence: true, numericality: { greater_than: 0 }
    validates :exit_price, presence: true, numericality: { greater_than: 0 }
    def pnl        
        exit_price.to_f - entry_price.to_f  
    end
end
