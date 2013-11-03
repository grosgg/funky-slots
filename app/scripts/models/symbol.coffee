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

            scale_x_diff = (C.SYMBOL_ORIGINAL_WIDTH / 2) * (C.SYMBOL_SCALE - 1)
            # scale_y_diff = (C.SYMBOL_ORIGINAL_HEIGHT / 2) * (C.SYMBOL_SCALE - 1)

            margin_reel = C.REEL_MARGIN * reel
            margin_symbol = C.SYMBOL_MARGIN * position

            @x = C.ORIGIN_X + reel * C.SYMBOL_WIDTH + scale_x_diff + margin_reel
            @y = position * C.SYMBOL_HEIGHT + margin_symbol

            @scaleX = C.SYMBOL_SCALE
            @scaleY = C.SYMBOL_SCALE

            @type = type

            return @

        spin: ()->
            @.addEventListener 'enterframe', ()->
                @_check_y_pos()
                @y += C.REEL_SPEED

        stop: ()->
            @.clearEventListener 'enterframe'

            @_check_y_pos()

            # Align symbol on slot
            @.tl.moveBy 0, ((C.SYMBOL_HEIGHT + C.SYMBOL_MARGIN) - @y % (C.SYMBOL_HEIGHT + C.SYMBOL_MARGIN)), 5
            # Shift one slot up
            # @y -= (C.SYMBOL_HEIGHT + C.SYMBOL_MARGIN)
            
        _check_y_pos: ()->
            if @y >= C.REEL_HEIGHT
                diff = @y - C.REEL_HEIGHT
                @y = diff