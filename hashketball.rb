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
def num_points_scored(player)
  game_hash.each do |key, value|
    value[:players].each do |player_stats|

      if player_stats[:player_name] == player
       return player_stats[:points]        
      end       

    end
  end
end


def shoe_size(player)
  game_hash.each do |key, value|
    value[:players].each do |player_stats|

      if player_stats[:player_name] == player
       return player_stats[:shoe]        
      end       

    end
  end
end

 

def team_colors(teamName)
  game_hash.each do |key, value|

    if value[:team_name] == teamName
      return value[:colors]
    end
  # binding.pry
  end
end 



def team_names 
  teamName_array = []
  game_hash.each do |key, value|
    # binding.pry
    teamName_array << value[:team_name] 
  end 
  teamName_array
end 

def player_numbers(teamName)
  numbersOFTeam = []
    game_hash.each do |key, value|
      value[:players].each do |player_stats|

        if value[:team_name] == teamName
          numbersOFTeam << player_stats[:number]
        end
    # binding.pry
      end 
    end
  numbersOFTeam
end 



def player_stats(playerName)
  game_hash.each do |key, value|
    value[:players].each do |player_stats|

      if player_stats[:player_name]  == playerName
        return player_stats
    # binding.pry
      end
    end
  end 
end 


def big_shoe_rebounds
  biggest_shoe = 0
  number_rebounds = 0

  game_hash.each do |key, value|
    value[:players].each do |player_stat|

      if biggest_shoe < player_stat[:shoe]
        biggest_shoe = player_stat[:shoe]
          number_rebounds = player_stat[:rebounds]
      end 

    end 
  end
  number_rebounds
end 



# BONUS QUESTIONS
def most_points_scored
  most_points = 0
  player_name = ''
  
  game_hash.each do |key, value|
      value[:players].each do |player_stat|
  
        if most_points < player_stat[:points]
          most_points = player_stat[:points]
          player_name = player_stat[:player_name]
        end 
  
      end 
  end
  player_name
end 

# expect "Ben Gordon" since points = 33
puts most_points_scored



def winning_team
  winner = {
     "Brooklyn Nets" => 0,
     "Charlotte Hornest" => 0
    }

 game_hash.each do |key, value|
   value[:players].each do |player_stats|

     if value[:team_name] == "Brooklyn Nets"
         winner["Brooklyn Nets"] += player_stats[:points]

     elsif value[:team_name] == "Charlotte Hornets"
         winner["Charlotte Hornest"] += player_stats[:points]
     end 
     
   end  
 end 
 winner.max_by{ |name, score| score}[0]
end 

puts winning_team
# [Brooklyn Nets points = 96 , Charlotte Hornets points = 85]  ===> expected: Brooklyn Nets



def player_with_longest_name
  longest_name = 0
  name = ''
  game_hash.each do |key, value|
      value[:players].each do |player_name|

         if longest_name < player_name[:player_name].length 
          longest_name = player_name[:player_name].length
          name = player_name[:player_name]
          end

      end
  end 
  name
end

puts player_with_longest_name
# expected Bismack Biyombo


# SUPER BONUS
def long_name_steals_a_ton
  most_steals = 0
  player_name_most_steals = ''
  longest_name = 0
  player_longest_name = ''
  
  game_hash.each do |key, value|
      value[:players].each do |player_stat|
  
        if most_steals < player_stat[:steals]
          most_steals = player_stat[:steals]
          player_name_most_steals = player_stat[:player_name]

          longest_name < player_stat[:player_name].length 
          longest_name = player_stat[:player_name].length
          player_longest_name = player_stat[:player_name]
        end
      
      end 
  end
  player_name_most_steals == player_longest_name
end
puts long_name_steals_a_ton
# expected: true since highest steals is 33 --> Bismack Biyombo and longest name = Bismack Biyombo