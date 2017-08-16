require 'test_helper'

class GameTest < ActiveSupport::TestCase
  
  class InitializationTest < ActiveSupport::TestCase
    test "cannot create a game without a user id" do
      game = Game.new(user_id: nil)
      assert_not game.save
    end
    
    test "cannot create a game without specifying the level" do
      game = Game.new(user_id: User.first.id)
      assert_not game.save
    end
    
    test "new game should have starting state with nine arrays" do
      game = Game.create(user_id: User.first.id, level: 1)
      assert_not_nil(game.start)
      assert_equal(9, game.start.length)
    end
    
    test "should initialize score to 0" do
      game = Game.create(user_id: User.first.id, level: 1)
      assert_equal(0, game.score)
    end
    
    test "should initialize moves to zero" do
      game = Game.create(user_id: User.last.id, level: 2)
      assert_equal(0, game.moves)
    end
  end

  class SolutionTests < ActiveSupport::TestCase
    setup do
      @game = Game.create(user_id: User.last.id, level: 2)
    end
    
    test "solution should be defined as an array with lenght nine" do
      assert_equal(9, @game.solution.length)
    end
    
    test "each element in solution is an array of length nine" do
      for i in 0..8
        assert_equal(9, @game.solution[i].length)
      end
    end
    
    test "each of the nine array in the solution has nine unique elements" do
      for i in 0..8
        assert_equal(9, @game.solution[i].uniq.length)
      end
    end
      
  end
  
end
