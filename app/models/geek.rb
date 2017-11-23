class Geek < ApplicationRecord

  # def get_api_response(keyword)
  # use this url to get a game by keyword
  #   url = "https://www.boardgamegeek.com/xmlapi/search?search=#{keyword}"

  # use this url to get a game by id
  # url = https://www.boardgamegeek.com/xmlapi/boardgame/69972?stats=1

  #   response = Net::HTTP.get_response(URI.parse(url))
  #   buffer = response.body
  #   h = Hash.from_xml(buffer).to_json
  #   result = JSON.parse(h)
  #   result["boardgames"]["boardgame"][0]["name"]
  # end
# end


# braille scrabble:
# https://www.boardgamegeek.com/xmlapi/search?search=scrabble
# https://www.boardgamegeek.com/xmlapi/boardgame/69972?stats=1
