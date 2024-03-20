require "test_helper"

class GameTest < ActiveSupport::TestCase
  test "draw match" do
    inputs = IO.readlines("storage/input.txt")
    p1_grid, p2_grid = Game.new(inputs, true).start

    p1_hits = p2_grid.flatten.count("X")
    p2_hits = p1_grid.flatten.count("X")

    assert_equal p1_hits, 3
    assert_equal p2_hits, 3
    assert_equal (p2_hits == p1_hits), true
  end

  test "p1 will win" do
    inputs = IO.readlines("storage/p1_input.txt")
    p1_grid, p2_grid = Game.new(inputs, true).start

    p1_hits = p2_grid.flatten.count("X")
    p2_hits = p1_grid.flatten.count("X")

    assert_equal p1_hits, 3
    assert_equal p2_hits, 2
    assert_equal (p2_hits < p1_hits), true
  end

  test "p2 will win" do
    inputs = IO.readlines("storage/p2_input.txt")
    p1_grid, p2_grid = Game.new(inputs, true).start

    p1_hits = p2_grid.flatten.count("X")
    p2_hits = p1_grid.flatten.count("X")

    assert_equal p1_hits, 3
    assert_equal p2_hits, 4
    assert_equal (p2_hits > p1_hits), true
  end
end
