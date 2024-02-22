# frozen_string_literal: true

require 'httparty'

class CryptoPriceApi
  include HTTParty

  base_uri 'https://api.coinlore.net/api'

  def initialize
  end

  def crypto_price_by_coin_id(coin_id)
    self.class.get("/ticker/?id=#{coin_id}")
  end

end