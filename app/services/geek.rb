class Geek < ApplicationRecord

  def get_api_response(keyword)
    url = "https://www.boardgamegeek.com/xmlapi/search?search=#{keyword}"

    response = Net::HTTP.get_response(URI.parse(url))
    buffer = response.body
    h = Hash.from_xml(buffer).to_json
    result = JSON.parse(h)
  end

  def assign_attributes(result)
    set_name(result)
    set_desc(result)
    set_year_pub(result)
    set_playtime(result)
    set_img(result)
    set_players(result)
  end

  def set_name(result)
    if result["boardgames"]["boardgame"]["name"]
      self.name = result["boardgames"]["boardgame"]["name"]
    elsif result["boardgames"]["boardgame"][0]["name"].sample
      self.name = result["boardgames"]["boardgame"][0]["name"].sample
    else
      self.name = "Unknown"
    end
  end

  def set_desc(result)
    if result["boardgames"]["boardgame"]["description"]
      self.desc = result["boardgames"]["boardgame"]["description"]
    else
      self.desc = "Unknown"
    end
  end

  def set_cat(result)
    if result["boardgames"]["boardgame"]["statistics"]["ratings"]["ranks"]["rank"][1]["type"]
      self.cat = result["boardgames"]["boardgame"]["statistics"]["ratings"]["ranks"]["rank"][1]["type"]
    else
      self.cat = "Unknown"
    end
  end

  def set_year_pub(result)
    if result["boardgames"]["boardgame"]["yearpublished"]
      self.year_pub = result["boardgames"]["boardgame"]["yearpublished"]
    else
      self.year_pub = "Unknown"
    end
  end

  def set_playtime(result)
    if result["boardgames"]["boardgame"]["playingtime"]
      self.play_time = result["boardgames"]["boardgame"]["playingtime"]
    else
      self.play_time = "Unknown"
    end
  end

  def set_img(result)
    if result["boardgames"]["boardgame"]["image"]
      self.img = result["boardgames"]["boardgame"]["image"]
    else
      self.img = ""
    end
  end

  def set_players(result)
    if result["boardgames"]["boardgame"]["minplayers"] && result["boardgames"]["boardgame"]["maxplayers"]
      min_players = result["boardgames"]["boardgame"]["minplayers"]
      max_players = result["boardgames"]["boardgame"]["maxplayers"]
      self.num_players = min_players + "-" + max_players
    else
      self.num_players = "Unknown"
    end
  end
end
