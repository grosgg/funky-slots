define [
    'underscore'
    'enchantjs'
    'constants'
    'models/reel'
    'models/prize_machine'
], (_, enchantjs, C, Reel, PrizeMachine)->

    GameScene = enchant.Class.create enchant.Scene,
        initialize: (game)->
            enchant.Scene.call(@)

            @.backgroundColor = 'white'
            @prize_machine = new PrizeMachine()
            @credits = C.CREDITS
            @reels = []

            for reel_index in [0...C.REELS_NUMBER] by 1
                @reels[reel_index] = new Reel(game, reel_index)
                @.addChild @reels[reel_index]

            bg = new Sprite 320, 320
            bg.image = game.assets['images/bg.png']
            bg.frame = 2
            bg.moveTo 0, 0
            @.addChild bg

            spin_button = new Label 'SPIN'
            spin_button.color = 'white'
            spin_button.font = '14px "Courier New"'
            spin_button.moveTo 250, 10
            spin_button.addEventListener 'touchstart', ()=>
                @.spin()
            @.addChild spin_button

            stop_button = new Label 'STOP'
            stop_button.color = 'white'
            stop_button.font = '14px "Courier New"'
            stop_button.moveTo 250, 30
            stop_button.addEventListener 'touchstart', ()=>
                @.stop()
            @.addChild stop_button

            return @

        spin: ()->
            return if @credits < C.BET

            for reel in @reels
                return if reel.is_spinning

            for reel in @reels
                reel.spin()

            @credits -= C.BET
            console.log @credits

        stop: ()->
            done_one = -1
            for reel, reel_index in @reels when done_one is -1
                if reel.is_spinning
                    reel.stop()
                    done_one = reel_index

            if done_one == @reels.length-1
                @.tl.delay(10).then ()=>
                    prize = @prize_machine.get_prize @_get_reels_positions()
                    @credits += prize
                    console.log @credits

        _get_reels_positions: ()->
            reels_positions = []
            for reel, reel_index in @reels
                reels_positions[reel_index] = reel.get_symbols_positions()

            console.log reels_positions
            return reels_positions


