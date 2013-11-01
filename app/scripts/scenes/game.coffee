define [
    'underscore'
    'enchantjs'
    'constants'
    'reel'
], (_, enchantjs, C, Reel)->

    GameScene = enchant.Class.create enchant.Scene,
        initialize: (game)->
            enchant.Scene.call(@)

            @.backgroundColor = 'white'

            @reels = []

            for reel_index in [0..2] by 1
                @reels[reel_index] = new Reel(game, reel_index)
                @.addChild @reels[reel_index]

            spin_button = new Label 'SPIN'
            spin_button.color = 'black'
            spin_button.font = '14px "Courier New"'
            spin_button.moveTo 250, 10
            spin_button.addEventListener 'touchstart', ()=>
                @.spin()
            @.addChild spin_button

            stop_button = new Label 'STOP'
            stop_button.color = 'black'
            stop_button.font = '14px "Courier New"'
            stop_button.moveTo 250, 30
            stop_button.addEventListener 'touchstart', ()=>
                @.stop()
            @.addChild stop_button

            return @

        spin: ()->
            for reel in @reels
                reel.spin() unless reel.is_spinning

        stop: ()->
            done = false
            for reel in @reels when done is false
                if reel.is_spinning
                    reel.stop()
                    done = true                
