class Board
    # Print board status
    def self.print
        val = App.table

        puts <<-STR
                #{val[1]} | #{val[2]} | #{val[3]}
                ---------
                #{val[4]} | #{val[5]} | #{val[6]}
                ---------
                #{val[7]} | #{val[8]} | #{val[9]}
            STR
    end
end
