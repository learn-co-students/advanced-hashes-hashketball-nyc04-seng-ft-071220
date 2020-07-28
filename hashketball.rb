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

def num_points_scored(name_input)
  player_point = 0
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]

  home_players.each do |player|
    if player[:player_name] == name_input
      player_point = player[:points]
      # binding.pry
    end
  end

  away_players.each do |player|
    if player[:player_name] == name_input
      player_point = player[:points]
      # binding.pry
    end
  end

  player_point
end

def shoe_size(name_input)
  player_shoe_size = 0
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]

  home_players.each do |player|
    if player[:player_name] == name_input
      player_shoe_size = player[:shoe]
      # binding.pry
    end
  end

  away_players.each do |player|
    if player[:player_name] == name_input
      player_shoe_size = player[:shoe]
      # binding.pry
    end
  end

  player_shoe_size
end

def team_colors(team_name)
  home_team_name = game_hash[:home][:team_name]
  away_team_name = game_hash[:away][:team_name]
  home_team_colors = game_hash[:home][:colors]
  away_team_colors = game_hash[:away][:colors]

  team_name == home_team_name ? home_team_colors : away_team_colors
end

def team_names
  home_team_name = game_hash[:home][:team_name]
  away_team_name = game_hash[:away][:team_name]
  [].push(home_team_name, away_team_name)
end

def player_numbers(team_name)
  jersey_numbers = []

  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]

  home_team_name = game_hash[:home][:team_name]
  away_team_name = game_hash[:away][:team_name]

  if team_name == home_team_name
    home_players.each do |player|
      jersey_numbers << player[:number]
      # binding.pry
    end
  end

  if team_name == away_team_name
    away_players.each do |player|
      jersey_numbers << player[:number]
      # binding.pry
    end
  end
  jersey_numbers
end

def player_stats(player_name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]

  home_players.each do |player|
    if player[:player_name] == player_name
      return player
    end
  end

  away_players.each do |player|
    if player[:player_name] == player_name
      return player
    end
  end
end

def big_shoe_rebounds
  biggest_shoe_size = 0
  most_rebounds = 0
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]

  home_players.each do |player|
    if biggest_shoe_size < player[:shoe]
      biggest_shoe_size = player[:shoe]
      most_rebounds = player[:rebounds]
    end
  end
  most_rebounds
  
  away_players.each do |player|
    if biggest_shoe_size < player[:shoe]
      biggest_shoe_size = player[:shoe]
      most_rebounds = player[:rebounds]
    end
  end
  most_rebounds
end

def most_points_scored
  most_points = 0
  player_name = ""
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]

  home_players.each do |player|
    if most_points < player[:points]
      most_points = player[:points]
      player_name = player[:player_name]
    end
  end
  most_points
  player_name

  
  away_players.each do |player|
    if most_points < player[:points]
      most_points = player[:points]
      player_name = player[:player_name]
    end
  end
  most_points
  player_name

  "#{player_name} scored the most points. #{most_points} points total."
end

p most_points_scored

def winning_team
  home_points = 0
  away_points = 0
  
  home_team_name = game_hash[:home][:team_name]
  away_team_name = game_hash[:away][:team_name]

  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]

  home_players.each do |player|
      home_points += player[:points]
  end

  away_players.each do |player|
      away_points += player[:points]
  end

  # home_points
  # away_points

  home_points > away_points ? home_team_name : away_team_name
  # binding.pry
end

p winning_team + " has the most points."

def player_with_longest_name
  longest_name = ""
  name_size = 0
  
  home_team_name = game_hash[:home][:team_name]
  away_team_name = game_hash[:away][:team_name]

  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]

  home_players.each do |player|
    if name_size < player[:player_name].size
      name_size = player[:player_name].size
      longest_name = player[:player_name]
    end
  end

  away_players.each do |player|
    if name_size < player[:player_name].size
      name_size = player[:player_name].size
      longest_name = player[:player_name]
    end
  end

  "#{longest_name} has the longest name. It's #{name_size} characters long."

  # binding.pry
end

p player_with_longest_name

def long_name_steals_a_ton
  longest_name = ""
  name_size = 0
  most_steals = 0
  player_with_most_steals = ""
  
  home_team_name = game_hash[:home][:team_name]
  away_team_name = game_hash[:away][:team_name]

  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]

  home_players.each do |player|
    if name_size < player[:player_name].size
      name_size = player[:player_name].size
      longest_name = player[:player_name] 
    end
  end

  away_players.each do |player|
    if name_size < player[:player_name].size
      name_size = player[:player_name].size
      longest_name = player[:player_name]
    end
  end

  home_players.each do |player|
    if most_steals < player[:steals]
      most_steals = player[:steals]
      player_with_most_steals = player[:player_name]
    end
  end

  away_players.each do |player|
    if most_steals < player[:steals]
      most_steals = player[:steals]
      player_with_most_steals = player[:player_name]
    end
  end

  player_with_most_steals == longest_name

end

p long_name_steals_a_ton

