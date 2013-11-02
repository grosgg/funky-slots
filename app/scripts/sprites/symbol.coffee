define ['enchantjs', 'constants'], (enchantjs, C)->

    Symbol = enchant.Class.create enchant.Sprite,
        initialize: (game, type, reel, position)->
            enchant.Sprite.call @, 16, 16
            @image = game.assets['images/icon0.png']

            @frame = switch type
                when C.SYMBOL_CHERRY then C.FRAME_CHERRY
                when C.SYMBOL_WATERMELON then C.FRAME_WATERMELON
                when C.SYMBOL_GRAPE then C.FRAME_GRAPE
                when C.SYMBOL_BANANA then C.FRAME_BANANA
                when C.SYMBOL_PIG then C.FRAME_PIG
                when C.SYMBOL_STAR then C.FRAME_STAR

            @x = reel * C.SYMBOL_WIDTH
            @y = position * C.SYMBOL_HEIGHT
            @type = type

            return @

        spin: ()->
            @.addEventListener 'enterframe', ()->
                @_check_y_pos()
                @y += C.REEL_SPEED

        stop: ()->
            @.clearEventListener 'enterframe'

            @_check_y_pos()
            @y += C.SYMBOL_HEIGHT - @y % C.SYMBOL_HEIGHT
            
        _check_y_pos: ()->
            if @y >= C.REEL_HEIGHT
                diff = @y - C.REEL_HEIGHT
                @y = diff