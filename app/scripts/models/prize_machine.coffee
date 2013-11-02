define ['enchantjs', 'constants'], (enchantjs, C)->

    class PrizeMachine
        constructor: ()->

        get_prize: (positions)->
            @positions = positions

            total = 0
            total += @_get_cherry_winnings()
            total += @_get_watermelon_winnings()
            total += @_get_grape_winnings()
            total += @_get_banana_winnings()
            total += @_get_star_winnings()
            total -= @_get_pig_loses()

            return total

        _get_cherry_winnings: ()->
            count = 0
            for i in [0...C.REELS_NUMBER] by 1
                count += 1 if @positions[i][C.PRIZE_ROW] == C.SYMBOL_CHERRY
            
            total = switch count
                when 1 then 5
                when 2 then 15
                when 3 then 50
                else 0
                
        _get_watermelon_winnings: ()->
            count = 0
            for i in [0...C.REELS_NUMBER] by 1
                count += 1 if @positions[i][C.PRIZE_ROW] == C.SYMBOL_WATERMELON
            
            total = switch count
                when 3 then 100
                else 0

        _get_grape_winnings: ()->
            count = 0
            for i in [0...C.REELS_NUMBER] by 1
                count += 1 if @positions[i][C.PRIZE_ROW] == C.SYMBOL_GRAPE
            
            total = switch count
                when 3 then 200
                else 0

        _get_banana_winnings: ()->
            count = 0
            for i in [0...C.REELS_NUMBER] by 1
                count += 1 if @positions[i][C.PRIZE_ROW] == C.SYMBOL_BANANA
            
            total = switch count
                when 3 then 1000
                else 0

        _get_star_winnings: ()->
            count = 0
            for i in [0...C.REELS_NUMBER] by 1
                count += 1 if @positions[i][C.PRIZE_ROW] == C.SYMBOL_STAR
            
            total = switch count
                when 3 then 5000
                else 0

        _get_pig_loses: ()->
            count = 0
            for i in [0...C.REELS_NUMBER] by 1
                count += 1 if @positions[i][C.PRIZE_ROW] == C.SYMBOL_PIG
            
            total = switch count
                when 1 then 10
                when 2 then 100
                when 3 then 3000
                else 0            