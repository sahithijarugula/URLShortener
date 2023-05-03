class UrlShortenerController < ApplicationController
  def encode
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

        if !Url.exists?(:short => @short_url)
          break
        end
      end

      Url.create(long: @long_url, short: @short_url)
      redirect_to final_encode_page_path
  end
  
  def final_encode
  end
end
