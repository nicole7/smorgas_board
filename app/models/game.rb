class Game < ApplicationRecord
  has_many :gamables
  has_many :users, through: :gamables

  def get_api_response(keyword)
    url = "https://www.boardgamegeek.com/xmlapi/search?search=#{keyword}"

    response = Net::HTTP.get_response(URI.parse(url))
    buffer = response.body
    h = Hash.from_xml(buffer).to_json
    result = JSON.parse(h)
  end

  # def assign_attributes(result)
  #   name = result["boardgames"]["boardgame"]["name"] || keyword.capitalize
  #   desc = result["boardgames"]["boardgame"]["description"]
  #   cat = result["boardgames"]["boardgame"]["statistics"]["ratings"]["ranks"]["rank"][1]["type"]
  #   min_players = result["boardgames"]["boardgame"]["minplayers"]
  #   max_players = result["boardgames"]["boardgame"]["maxplayers"]
  #   play_time = result["boardgames"]["boardgame"]["playingtime"]
  #   year_pub = result["boardgames"]["boardgame"]["yearpublished"]
  #   img = result["boardgames"]["boardgame"]["image"]

  #   num_players = min_players + "-" + max_players
  # end

end


# monopoly_id = 1406
# sorry_id = 2407
# scrabble_id = 320
# candyland_id = 5048
# life_id = 169714
# buffy_id = 7822
# risk_id = 2331
# scattergories_id = 2381
# card_against_humanity_id = 50381
# apples_to_apples_id = 74
# battleship_id = 2425
# operation_id = 3737
# mousetrap_id = 2679
# settlers_of_catan_id = 278
# hungry_hungry_hippos_id = 5895

# pictionary_id = 2281
# uno_id = 2223
# mille_bornes_id = 590
# chutes_and_ladders_id = 5432

#   url = "https://www.boardgamegeek.com/xmlapi/boardgame/69972?stats=1"

  # response = Net::HTTP.get_response(URI.parse(url))
  # buffer = response.body
  # h = Hash.from_xml(buffer).to_json
  # result = JSON.parse(h)

# Game.create!(name: "Monopoly", description: desc, category: cat, player_num: num_players, playing_time: play_time, year_created: year_pub, image_url: img)


