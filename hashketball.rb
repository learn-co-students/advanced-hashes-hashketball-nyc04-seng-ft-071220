

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

def num_points_scored(specific_player_name)
  game_hash.each do |k, v|
    v[:players].each do |stats|
        if stats[:player_name] == specific_player_name
          return stats[:points]
        end
     end
  end
end

#num_points_scored("Kemba Walker")
#iterate locations within game_hash (location_hash)
#iterate all the :players within locations (player_hash)
##if player_hash[:player_name] is equal to specific_player_name,
#return the player_hash[:points]


def shoe_size(specific_player_name)
  game_hash.each do |k, v| # v = hash
    v[:players].each do |stats| # stats = hash
        if stats[:player_name] == specific_player_name
          return stats[:shoe]
        end
     end
  end
end


def team_colors(team_name)
    game_hash.each do |k, v|
      if v[:team_name] == team_name
        return v[:colors]
      end
    end
end

require 'pry'




def team_names
 array=[]
  game_hash.each do |k, v|
     v[:team_name]
     array<<v[:team_name]
  end
    return array
end


def player_numbers(team)
  array=[]
   game_hash.each do |k, v|
      if v[:team_name] == team
        v[:players].each do |stats|
          array<<stats[:number]
        end
        return array
      end
  end
end

def player_stats(specific_player_name)
  game_hash.each do |k, v|
    v[:players].each do |stats|
        if stats[:player_name] == specific_player_name
          return stats
        end
     end
  end
end

def big_shoe_rebounds
  all_players = []
  game_hash.each do |k, v|
    all_players+= v[:players]
  end
  pp all_players
  return all_players.max_by{|k| k[:shoe]}[:rebounds]
end
