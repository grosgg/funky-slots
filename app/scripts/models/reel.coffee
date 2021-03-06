define [
    'underscore'
    'enchantjs'
    'constants'
    'models/symbol'
], (_, enchantjs, C, Symbol)->

    Reel = enchant.Class.create enchant.Group,
        initialize: (game, reel_index)->
            enchant.Group.call @
        
            @game = game
            @symbols = []
            @reel_base = _.shuffle C.REEL_BASE
            # @frame_modulo = 0

            for symbol_type, position in @reel_base
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
            #     if (@game.frame * @game.reel_speed) % C.SYMBOL_HEIGHT < @frame_modulo
            #         @game.assets['sounds/click.wav'].play()
            #     @frame_modulo = (@game.frame * @game.reel_speed) % C.SYMBOL_HEIGHT

        stop: ()->
            # @game.assets['sounds/click.wav'].play()
            
            for symbol in @symbols
                symbol.stop()
            @is_spinning = false

            @.clearEventListener 'enterframe'
            # @frame_modulo = 0

        get_symbols_positions: ()->
            symbols_positions = []

            for symbol, symbol_index in @symbols
                symbols_positions[Math.round(symbol.y) / (C.SYMBOL_HEIGHT + C.SYMBOL_MARGIN)] = symbol.type

            return symbols_positions



