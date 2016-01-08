
class Person
attr_accessor :lives
attr_accessor :score
attr_accessor :name
  def initialize(name, lives, score)
    @name = name
    @lives = lives
    @score = score
  end

end

@player_1 = Person.new("Player 1", 3, 0)
@player_2 = Person.new("Player 2", 3, 0)

def generate_question
  x = rand(1..20)
  y = rand(1..20)
  @answer = x + y
  @question = "#{x} + #{y}"
end

def prompt_player_answer
  puts "What does #{generate_question} equal?"
  @ask_for_answer = gets.chomp
end

def verify_answer
  @answer == @ask_for_answer.to_i
end

def players_alive
  @player_1.lives >= 1 && @player_2.lives >= 1
end

turn = 1
while players_alive

  if turn.even?
    current_player = @player_2
    other_player = @player_1
  else
    current_player = @player_1
    other_player = @player_2
  end

  prompt_player_answer

  if verify_answer
    current_player.score += 1
    puts "Your score is now #{current_player.score}"
  else
    current_player.lives -= 1
    puts "You now have #{current_player.lives} lives left"
  end

  turn += 1

end

puts "#{current_player.name} is the winner! #{other_player.name}'s score is #{other_player.score}."


