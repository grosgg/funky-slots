define [
    'underscore'
    'enchantjs'
    'constants'
    'models/reel'
    'models/prize_machine'
    'models/score_label'
    'models/action_button'
], (_, enchantjs, C, Reel, PrizeMachine, ScoreLabel, ActionButton)->

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

            @score_label = new ScoreLabel 20, 40
            @score_label.update C.CREDITS
            @.addChild @score_label

            spin_button = new ActionButton 'SPIN', 100, 290
            spin_button.addEventListener 'touchstart', ()=>
                @.spin()
            @.addChild spin_button

            stop_button = new ActionButton 'STOP', 200, 290
            stop_button.addEventListener 'touchstart', ()=>
                @.stop()
            @.addChild stop_button

            finger = new Sprite 16, 16
            finger.image = game.assets['images/icon0.png']
            finger.frame = 42
            finger.scaleX = 2
            finger.scaleY = 2
            finger.moveTo 16, 174
            @addChild finger

            return @

        spin: ()->
            return if @credits < C.BET

            for reel in @reels
                return if reel.is_spinning

            for reel in @reels
                reel.spin()

            @credits -= C.BET

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
                    @score_label.update @credits

        _get_reels_positions: ()->
            reels_positions = []
            for reel, reel_index in @reels
                reels_positions[reel_index] = reel.get_symbols_positions()

            return reels_positions


