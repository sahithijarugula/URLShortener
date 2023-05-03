class UrlShortenerController < ApplicationController
  def encode
    if params[:submit_button]
      @long_url = params[:input_long]
      s = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
      loop do
        deci = rand(999999)
        hash = ""
        while deci > 0
          hash = s[deci % 62] + hash
          deci /= 62
        end

        @short_url = "https://short.est/" + hash

        if !UrlShortener.exists?(:short => @short_url)
          break
        end
      end

      UrlShortener.create(long: @long_url, short: @short_url)
      @url = UrlShortener.where(long: @long_url)
      render json: @url, only: [:long, :short]
    end
  end

  def decode
    if params[:submit_button]
      @short_url = params[:input_short]
      @long_url = UrlShortener.where(short: @short_url).pluck(:long)
      if @long_url.empty?
        puts "short url does not exist. Please try again."
      end
      
      @url = UrlShortener.where(long: @long_url)
      render json: @url, only: [:long, :short]
    end
  end
end
