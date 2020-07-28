# Write your code below game_hash
require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

#rspec spec/hashketball_spec.rb -e num_points_scored
def num_points_scored (player_name)
  game_hash.each{|team, properties|
  game_hash[team][:players].each{|player|
  if player[:player_name] === player_name
    return player[:points]
  end
  }  
}
end

#rspec spec/hashketball_spec.rb -e shoe_size

def shoe_size(player_name)
  game_hash.each{|team, properties|
  game_hash[team][:players].each{|player|
  if player[:player_name] === player_name
    return player[:shoe]
  end
  }  
}
end

#rspec spec/hashketball_spec.rb -e team_colors
def team_colors(team_name)
  game_hash.each{|home_or_away,team_properties|
  if game_hash[home_or_away][:team_name] === team_name
    return game_hash[home_or_away][:colors]
  end
  }
end

#rspec spec/hashketball_spec.rb -e team_names
def team_names
  team_names_array = []
  game_hash.each{|home_or_away,team_properties|
  team_names_array << game_hash[home_or_away][:team_name]
  }
  team_names_array
end

#rspec spec/hashketball_spec.rb -e player_numbers
def player_numbers(team_name)
  player_numbers_array=[]
  game_hash.each{|home_or_away,team_properties|
  game_hash[home_or_away][:players].each{|player|
  if game_hash[home_or_away][:team_name] === team_name
    player_numbers_array << player[:number]
  end
}
}
player_numbers_array
end

#rspec spec/hashketball_spec.rb -e player_stats
def player_stats(player_name)
  game_hash.each{|home_or_away,team_properties|
  game_hash[home_or_away][:players].each{|player|
  #binding.pry
  if player[:player_name] === player_name
   return player
  end
}
}
end

# First, find the player with the largest shoe size
# Then, return that player's number of rebounds
# Remember to think about return values here.
#rspec spec/hashketball_spec.rb -e big_shoe_rebounds
def big_shoe_rebounds
  max_shoe = -1
  rebounds = -1
  game_hash.each{|home_or_away,team_properties|
  game_hash[home_or_away][:players].each{|player|
  if max_shoe < player[:shoe]
    max_shoe = player[:shoe]
    rebounds = player[:rebounds]
  end
}
}
rebounds
end