define [
    'underscore'
    'enchantjs'
    'constants'
    'sprites/symbol'
], (_, enchantjs, C, Symbol)->

    Reel = enchant.Class.create enchant.Group,
        initialize: (game, reel_index)->
            enchant.Group.call @
        
            @game = game
            @symbols = []
            @frame_modulo = 0

            for symbol_type, position in _.shuffle C.REEL_BASE
                @symbols[position] = new Symbol @game, symbol_type, reel_index, position
                @.addChild @symbols[position]

            @is_spinning = false
            return @

        spin: ()->
            for symbol in @symbols
                symbol.spin()
            @is_spinning = true


            # @.addEventListener 'enterframe', ()->
            #     # Play sound on each slot passed
            #     if (@game.frame * C.REEL_SPEED) % C.SYMBOL_HEIGHT < @frame_modulo
            #         @game.assets['sounds/click.wav'].play()
            #     @frame_modulo = (@game.frame * C.REEL_SPEED) % C.SYMBOL_HEIGHT

        stop: ()->
            for symbol in @symbols
                symbol.stop()
            @is_spinning = false

            @.clearEventListener 'enterframe'
            @frame_modulo = 0

