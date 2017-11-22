class Geek < ApplicationRecord

  # def get_api_response(keyword)
  #   url = "http://www.boardgamegeek.com/xmlapi/search?search=#{keyword}"
  #   response = NET::HTTP.get_response(URI.parse(url))
  #   buffer = response.body
  #   result = JSON.parse(buffer)
  # end
end
