require "pry"
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

#based on the player name, finds the number of points the player scored
def num_points_scored(player_name)
  scored_points = 0
  game_hash.each do |team,info|
    info.each do |team_info,team_data|
      if team_data.is_a? (Array) 
        if team_info != :colors
          team_data.find do |player_index|
            if player_index[:player_name] == player_name
              scored_points = player_index[:points]
            end
          end
        end
      end
    end
  end
  scored_points
end

#based on the players name given, finds the shoe size of the player
def shoe_size(player_name)
  player_shoe_size = 0
  game_hash.each do |team,info|
    info.each do |team_info,team_data|
      if team_data.is_a? (Array) 
        if team_info != :colors
          team_data.find do |player_index|
            if player_index[:player_name] == player_name
              player_shoe_size = player_index[:shoe]
            end
          end
        end
      end
    end
  end
  player_shoe_size
end

#based on the name of the team given, finds the colors of the team
def team_colors(team_name)
  team_color = []
  game_hash.find do |team,info|
    if info[:team_name] == team_name
      team_color = info[:colors]
    end
    info[:team_name] == team_name
  end
  team_color
end

#finds the name of the teams involved
def team_names
  team_name = []
  game_hash.each do |team,info|
    team_name << info[:team_name]
  end
  team_name
end

#base on the team name given, finds the number for each of it's players
def player_numbers(team_name)
  team_player_numbers = []
  game_hash.each do |team,info|
    info.each do |team_info,team_data|
        if team_data.is_a? (Array) 
          if team_info != :colors && info[:team_name] == team_name
            team_data.each do |player_index|
              team_player_numbers << player_index[:number]
            end
          end
        end
    end
  end
  team_player_numbers
end
 
#based on the name given, finds the player's stats
def player_stats(player_name)
  player_stat = {}
  game_hash.each do |team,info|
    info.each do |team_info,team_data|
        if team_data.is_a? (Array) 
          if team_info != :colors
            team_data.each do |player_index|
              if player_index[:player_name] == player_name
                player_stat = player_index
              end
            end
          end
        end
    end
  end
  player_stat
end

#finds the number of rebounds the player with the biggest shoe size has
def big_shoe_rebounds
  player_with_the_largest_shoe_size = 0
  most_rebounds = 0
  game_hash.each do |team,info|
    info.each do |team_info,team_data|
      if team_data.is_a? (Array) 
        if team_info != :colors
          team_data.each do |player_index|
            if player_with_the_largest_shoe_size == 0 || player_index[:shoe] > player_with_the_largest_shoe_size  
              player_with_the_largest_shoe_size = player_index[:shoe]
              most_rebounds = player_index[:rebounds]
            end
          end
        end
      end
    end
  end
  most_rebounds
end

#finds the players with the most points scored
def most_points_scored
  most_points_scored = 0
  player_with_the_most_points_scored = ""
  game_hash.each do |team,info|
    info.each do |team_info,team_data|
      if team_data.is_a? (Array) 
        if team_info != :colors
          team_data.each do |player_index|
            if most_points_scored == 0 || player_index[:points] > most_points_scored  
              most_points_scored = player_index[:points]
              player_with_the_most_points_scored = player_index[:player_name]
            end
          end
        end
      end
    end
  end
  player_with_the_most_points_scored
end

#finds based on points scored by each player in each team
#which team is winning atm
def winning_team
  home_points = 0
  away_points = 0
  team1 = "Brooklyn Nets"
  team2 = "Charlotte Hornets"
  game_hash.each do |team,info|
    info.each do |team_info,team_data|
      if team_data.is_a? (Array) 
        if team_info != :colors
          if info[:team_name] == "Brooklyn Nets"
            team_data.each do |player_index|
              home_points += player_index[:points]
            end
          else 
            team_data.each do |player_index|
              away_points += player_index[:points]
          winning_team  end
          end
        end
      end
    end
  end

  if home_points > away_points
    team1
  else
    team2
  end

end

#gets the players with the longest name
def player_with_longest_name
longest_name = ""
game_hash.each do |team,info|
  info.each do |team_info,team_data|
    if team_data.is_a? (Array) 
      if team_info != :colors
        team_data.each do |player_index|
          if longest_name == "" || player_index[:player_name] > longest_name  
            longest_name = player_index[:player_name]
            longest_name = player_index[:player_name]
          end
        end
      end
    end
  end
end
longest_name
end





#Super Bonus
#gets the highest number of steals
def most_steals 
  num_steals = 0
  game_hash.each do |team,info|
    info.each do |team_info,team_data|
      if team_data.is_a? (Array) 
        if team_info != :colors
          team_data.each do |player_index|
            if num_steals == 0 || player_index[:steals] > num_steals  
              num_steals = player_index[:steals]              
            end
          end
        end
      end
    end
  end
num_steals
end

#uses most_steals and finds out if the player with the longest lame
#also has the most number of steals
def long_name_steals_a_ton? 
  longest_name = ""
  player_steals = 0
  game_hash.each do |team,info|
    info.each do |team_info,team_data|
      if team_data.is_a? (Array) 
        if team_info != :colors
          team_data.each do |player_index|
            if longest_name == "" || player_index[:player_name] > longest_name  
              longest_name = player_index[:player_name]
              longest_name = player_index[:player_name]
              player_steals = player_index[:steals]
            end
          end
        end
      end
    end
  end
  if player_steals > most_steals
    true
  else
    false
  end
end