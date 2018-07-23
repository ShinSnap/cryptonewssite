class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    # Get News Data
    url = 'https://min-api.cryptocompare.com/data/v2/news/?lang=EN'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @news = JSON.parse(response)

    # Get Price Data
    price_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETC,LTC,XRP,NEO&tsyms=USD'
    price_uri = URI(price_url)
    price_response = Net::HTTP.get(price_uri)
    @prices = JSON.parse(price_response)
  end

  def prices
    require 'net/http'
    require 'json'

    @symbol = params[:sym]
    if @symbol
      symbol_url = "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=#{@symbol.upcase}&tsyms=USD"
      symbol_uri = URI(symbol_url)
      symbol_response = Net::HTTP.get(symbol_uri)
      @symbol_price = JSON.parse(symbol_response)
    end

  end
end
