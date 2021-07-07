require 'pry'
# Write your code below game_hash
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

#takes in an argument of a player's name
#returns the number of points scored for that player.
def num_points_scored(player_name)
  player_points = nil
  game_hash.each do |team, team_stats|
    team_stats[:players].each do |player_stats|
      if player_stats[:player_name] == player_name
        player_points = player_stats[:points]
      end
    end
  end
  player_points
end

#num_points_scored("Jeff Adrien")
#if player_name = "Jeff Adrien" output should be 10
#p game_hash[:away][:players][0][:points]

#takes in an argument of a player's name
#returns the shoe size for that player.
def shoe_size(player_name)
  player_shoe_size = nil
  game_hash.each do |team, team_stats|
    team_stats[:players].each do |player_stats|
      if player_stats[:player_name] == player_name
        player_shoe_size = player_stats[:shoe]
      end
    end
  end
  player_shoe_size
end

#takes in an argument of the team name
#returns an Array of that team's colors.
#map or find methods
def team_colors(team_name)
  team_colors = nil
  game_hash.map do |team, team_stats|
    if team_stats[:team_name] == team_name
      team_colors = team_stats[:colors]
    end
  end
  team_colors
end

#team_colors("Charlotte Hornets")
#if team_name = "Charlotte Hornets" output should be ["Turquoise", "Purple"]
#p game_hash[:away][:colors] #=> ["Turquoise", "Purple"]

#operates on the game Hash to return an Array of the team names
#map method
def team_names
  game_hash.map do |team, team_stats|
    team_stats[:team_name]
  end
end

#p team_names

#takes in an argument of a team name 
#returns an Array of the jersey numbers for that team.
#map method returns an array
def player_numbers(team_name)
  team_numbers = nil
  game_hash.map do |team, team_stats|
    if team_stats[:team_name] == team_name
      team_numbers = team_stats[:players].map do |player_stats|
        player_stats[:number]
      end
    end
  end
  team_numbers
end

#p player_numbers("Charlotte Hornets")
#if team_name = "Charlotte Hornets" outputs should be [4, 0, 2, 8, 33]
#p game_hash[:away][:players][0][:number] #=> 4

#takes in an argument of a player's name 
#returns a hash of that player's stats.
#select method returns a sub-hash
def player_stats(player_name)
  player_name_stats = nil
  game_hash.select do |team, team_stats|
    team_stats[:players].select do |player_stats|
      if player_stats[:player_name] == player_name
        player_name_stats = player_stats
      end
    end
  end
  player_name_stats
end

#player_stats("Alan Anderson")
#if player_name = "Alan Anderson" outputs should be {:player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1}
#p game_hash[:home][:players][0]

#return number of rebounds associated with the player w/ the largest shoe size.
  #First, find the player with the largest shoe size
  #Then, return that player's number of rebounds
  #Remember to think about return values here.
def big_shoe_rebounds
  largest_shoe_size = 0
  largest_player = nil
  game_hash.each do |team, team_stats|
    team_stats[:players].each do |player_stats|
      if largest_shoe_size < player_stats[:shoe] 
        largest_shoe_size = player_stats[:shoe]
        largest_player = player_stats[:rebounds]
      end
    end
  end
  largest_player
end

#big_shoe_rebounds
#largest shoe size is 19
  #game_hash[:home][:players][3][:shoe]
#player with largest shoe size = "Mason Plumlee"
  #game_hash[:home][:players][3][:player_name]
#his number of rebounds is 11
  #game_hash[:home][:players][3][:rebounds]

#Which player has the most points?
def most_points_scored
  most_points = 0
  most_points_player = nil
  game_hash.each do |team, team_stats|
    team_stats[:players].each do |player_stats|
      if most_points < player_stats[:points]
        most_points = player_stats[:points]
        most_points_player = player_stats[:player_name]
      end
    end
  end
  most_points_player
end

#p most_points_scored
#most points = 33
  #game_hash[:away][:players][3][:points]
#player with the most points = "Ben Gordon"
  #game_hash[:away][:players][3][:player_name]

#Which team has the most points?
def winning_team
  home_team_sum = 0
  away_team_sum = 0
  game_hash.each do |team, team_stats|
    if team_stats[:team_name] == "Brooklyn Nets"
      team_stats[:players].each do |player_stats|
        home_team_sum += player_stats[:points]
      end
    elsif team_stats[:team_name] == "Charlotte Hornets"
      team_stats[:players].each do |player_stats|
        away_team_sum += player_stats[:points]
      end
    end
  end
  if home_team_sum > away_team_sum
    game_hash[:home][:team_name]
  elsif home_team_sum < away_team_sum
    game_hash[:away][:team_name]
  end
end

#winning_team
#home Brooklyn Nets: 96 vs away Charlotte Hornets: 85

#Which player has the longest name?
def player_with_longest_name
  longest_name = 0
  longest_player_name = nil
  game_hash.each do |team, team_stats|
    team_stats[:players].each do |player_stats|
      if longest_name < player_stats[:player_name].length
        longest_name = player_stats[:player_name].length
        longest_player_name = player_stats[:player_name]
      end
    end
  end
  longest_player_name
end

#player_with_longest_name
#p game_hash[:home][:players][0][:player_name].length
#output should be "Bismack Biyombo"

#returns true if the player with the longest name had the most steals
#Find out who has the most steals
#Find the longest name (reference longest_player_name method)
#Are they equal to e/o?
def long_name_steals_a_ton?
  highest_number_steals = 0
  player_most_steals = nil
  game_hash.each do |team, team_stats|
    team_stats[:players].each do |player_stats|
      if highest_number_steals < player_stats[:steals]
        highest_number_steals = player_stats[:steals]
        player_most_steals = player_stats[:player_name]
      end
    end
  end
  if player_most_steals == player_with_longest_name
    true
  else
    false
  end
end

#long_name_steals_a_ton?
#output should be true