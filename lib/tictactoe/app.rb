class App
    @@table = { 1 => 1,
                2 => 2,
                3 => 3,
                4 => 4,
                5 => 5,
                6 => 6,
                7 => 7,
                8 => 8,
                9 => 9}

    class << self
        def table
            @@table
        end

        def run
            loop do
              puts "To exit, use 'Ctrl+C':"
              puts "Player #{player}, please enter position:"
              Board.print

              loop do
                @@index = gets.chomp.to_i
                break if check_available_slot(@@index) == true
              end

              table[@@index] = player
              break if check_winner
              switch_player
              puts
            end
        end

        private

        def check_available_slot(ind)
          available_slots = table.select { |_k,v| v != 'X' && v != 'O' }.keys
          unless available_slots.include?(ind)
            puts "Please enter available slot value: #{available_slots.join(', ')}:"
            false
          else
            true
          end
        end

        def check_winner
          if [table[1],table[2],table[3]].uniq.length == 1 ||
             [table[4],table[5],table[6]].uniq.length == 1 ||
             [table[7],table[8],table[9]].uniq.length == 1 ||
             [table[1],table[4],table[7]].uniq.length == 1 ||
             [table[2],table[5],table[8]].uniq.length == 1 ||
             [table[3],table[6],table[9]].uniq.length == 1 ||
             [table[1],table[5],table[9]].uniq.length == 1 ||
             [table[3],table[5],table[7]].uniq.length == 1
            puts "CONGRATS!!! THE WINNER IS PLAYER #{player}"
            Board.print
            true
          else
            false
          end
        end

        def player
          @@player ||= 'X'
        end

        def switch_player
            @@player = @@player == 'X' ? 'O' : 'X'
        end
    end
end
