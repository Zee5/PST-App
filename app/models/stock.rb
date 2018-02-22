class Stock < ActiveRecord::Base
    def self.new_from_lookup(ticker_symbol)
        looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
        price = strip_commas(looked_up_stock.l) # strip the comma price 
        new(name: looked_up_stock.name, ticker: looked_up_stock.symbol, last_price: price)
    end
    #strip cooma method to remove commas
    def self.strip_commas(number)
        number.gsub(",", "")   
    end
end
