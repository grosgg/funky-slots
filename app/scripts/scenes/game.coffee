define [
    'underscore'
    'enchantjs'
    'constants'
    'sprites/symbol'
], (_, enchantjs, C, Symbol)->

    GameScene = enchant.Class.create enchant.Scene,
        initialize: (game)->
            enchant.Scene.call(@)

            @.backgroundColor = 'white'

            reels = []

            for reel_index in [0..2] by 1
                reels[reel_index] = []
                reel = _.shuffle C.REEL_BASE
            
                for symbol_type, position in reel
                    reels[reel_index][position] = new Symbol game, symbol_type, reel_index, position
                    @.addChild reels[reel_index][position]

            return @