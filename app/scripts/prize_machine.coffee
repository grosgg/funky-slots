define ['enchantjs', 'constants'], (enchantjs, C)->

    class PrizeMachine
        constructor: ()->

        get_prize: (positions)->
            @positions = positions

            total = 0
            total += @_get_cherry_winnings()

            return total

        _get_cherry_winnings: ()->
            count_cherry = 0
            for i in [0...C.REELS_NUMBER] by 1
                count_cherry += 1 if @positions[i][5] == C.SYMBOL_CHERRY
            
            total_cherry = switch count_cherry
                when 1 then 5
                when 2 then 15
                when 3 then 50
                else 0
                
            