class UrlShortenerController < ApplicationController
  @@short = ""
  @@long = ""

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
      @@short = @short_url
      @@long = @long_url
      redirect_to final_encode_page_path
    end
  end
  
  def final_encode
    @short_url = @@short
    @long_url = @@long
  end
end
