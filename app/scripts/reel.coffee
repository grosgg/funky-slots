define [
    'underscore'
    'enchantjs'
    'constants'
    'sprites/symbol'
], (_, enchantjs, C, Symbol)->

    Reel = enchant.Class.create enchant.Group,
        initialize: (game, reel_index)->
            enchant.Group.call @
        
            @symbols = []

            for symbol_type, position in _.shuffle C.REEL_BASE
                @symbols[position] = new Symbol game, symbol_type, reel_index, position
                @.addChild @symbols[position]

            @is_spinning = false
            return @

        spin: ()->
            for symbol in @symbols
                symbol.spin()
            @is_spinning = true

        stop: ()->
            for symbol in @symbols
                symbol.stop()
            @is_spinning = false

