require 'logger'

class Api::V1::CryptoController < ApplicationController
  logger = Logger.new(STDOUT)

  def show
    coin_id = params[:id]
    crypto_api = CryptoPriceApi.new

    crypto_api.crypto_price_by_coin_id(coin_id)

    api_response = crypto_api.crypto_price_by_coin_id(coin_id)

    if api_response.code == 200
      @json = JSON.parse(api_response.body)

      logger.debug(@json[0])

      render json: {
        data: {
          name: @json[0]['symbol'],
          price: @json[0]['price_usd']
        },
        status: 200
      }
    else
      render json: {
        data: "fetch_failed",
        status: 500
      }
    end

  end
end
