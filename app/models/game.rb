class Game
    def initialize(inputs, file=false)
        if file
            @grid_size = inputs[0].chomp.to_i
            @total_ships = inputs[1].chomp.to_i
            @p1_pos = inputs[2].chomp
            @p2_pos = inputs[3].chomp
            @total_missiles = inputs[4].chomp.to_i
            @p1_movs = inputs[5].chomp
            @p2_movs = inputs[6].chomp
        else
            @grid_size = inputs[:grid_size].to_i
            @total_ships = inputs[:total_ships].to_i
            @p1_pos = inputs[:p1_pos]
            @p2_pos = inputs[:p2_pos]
            @total_missiles = inputs[:total_missiles]
            @p1_movs = inputs[:p1_movs]
            @p2_movs = inputs[:p2_movs]
        end
    end

    def start
        @p1_grid = Array.new(@grid_size) { Array.new(@grid_size)}
        @p2_grid = Array.new(@grid_size) { Array.new(@grid_size)}

        set_players(@p1_pos, @p1_grid)
        set_players(@p2_pos, @p2_grid)

        play_moves(@p2_movs, @p1_grid)
        play_moves(@p1_movs, @p2_grid)
        [@p1_grid, @p2_grid]
    end

    def result
        start
        puts "======P1 player======"
        @p1_grid.each do |row|
            row.each do |field|
                print field.nil? ? '-' : field
            end
            puts
        end
        puts "======P2 player======"
        @p2_grid.each do |row|
            row.each do |field|
                print field.nil? ? '-' : field
            end
            puts
        end
        
        puts
        puts "P1: #{@p2_grid.flatten.count("X")}"
        puts "P2: #{@p1_grid.flatten.count("X")}"
        if @p1_grid.flatten.count("X") > @p2_grid.flatten.count("X")
            puts "Player 2 wins"
        elsif @p1_grid.flatten.count("X") < @p2_grid.flatten.count("X")
            puts "Player 1 wins"
        else
            puts "It is a draw"
        end
    end

    private

    def set_players(postions, grid)
        postions.split(':').each do |pos|
          grid[pos.split(',').first.to_i][pos.split(',').last.to_i] = 'B'
        end
      end
    
      def play_moves(moves, grid)
        moves.split(':').each do |mov|
          mov_location = grid[mov.split(',').first.to_i][mov.split(',').last.to_i]
    
          if mov_location
            grid[mov.split(',').first.to_i][mov.split(',').last.to_i] =  'X'
          else
            grid[mov.split(',').first.to_i][mov.split(',').last.to_i] =  'O'
          end
        end
      end
end
