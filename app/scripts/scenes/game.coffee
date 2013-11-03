define [
    'underscore'
    'enchantjs'
    'constants'
    'models/reel'
    'models/prize_machine'
    'models/info_label'
    'models/action_button'
], (_, enchantjs, C, Reel, PrizeMachine, InfoLabel, ActionButton)->

    GameScene = enchant.Class.create enchant.Scene,
        initialize: (game)->
            enchant.Scene.call(@)

            @.backgroundColor = 'white'
            @prize_machine = new PrizeMachine()
            @credits = C.CREDITS
            @reels = []

            for reel_index in [0...C.REELS_NUMBER] by 1
                @reels[reel_index] = new Reel(game, reel_index)
                @addChild @reels[reel_index]

            bg = new Sprite 320, 320
            bg.image = game.assets['images/bg.png']
            bg.frame = 2
            bg.moveTo 0, 0
            @addChild bg

            @score_label = new InfoLabel 'CREDITS: ', 20, 35
            @score_label.update C.CREDITS
            @addChild @score_label

            @prize_label = new InfoLabel '', 200, 35
            @addChild @prize_label

            spin_button = new ActionButton 'SPIN', 88, 290
            spin_button.addEventListener 'touchstart', ()=>
                @.spin()
            @addChild spin_button

            stop_button = new ActionButton 'STOP', 200, 290
            stop_button.addEventListener 'touchstart', ()=>
                @.stop()
            @addChild stop_button

            finger = new Sprite 16, 16
            finger.image = game.assets['images/icon0.png']
            finger.frame = 42
            finger.scaleX = 2
            finger.scaleY = 2
            finger.moveTo 16, 174
            @addChild finger

            exit = new Sprite 16, 16
            exit.image = game.assets['images/icon0.png']
            exit.frame = 43
            exit.moveTo 296, 8
            exit.rotate 270
            exit.scale 2, 2
            exit.addEventListener 'touchend', ()=>
                game.dispatchEvent(new Event('gameover'))
            @addChild exit

            @gameover = new Group()

            gameover_sprite = new Sprite 16, 16
            gameover_sprite.image = game.assets['images/icon0.png']
            gameover_sprite.frame = 22
            gameover_sprite.scaleX = 14
            gameover_sprite.scaleY = 14
            gameover_sprite.moveTo 160, 175
            @gameover.addChild gameover_sprite

            gameover_label = new Label 'GAME OVER'
            gameover_label.color = 'red'
            gameover_label.font = '56px "Courier New"'
            gameover_label.moveTo 10, 224
            @gameover.addChild gameover_label

            return @

        spin: ()->
            return if @credits < C.BET

            for reel in @reels
                return if reel.is_spinning

            for reel in @reels
                reel.spin()

            @credits -= C.BET
            @score_label.update @credits

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

                    if prize < 0
                        @prize_label.color = 'red'
                        @prize_label.update prize + '!!'
                    else 
                        @prize_label.color = 'green'
                        @prize_label.update '+' + prize

                    @.tl.delay(C.FPS*2).then ()=>
                        @prize_label.update ''
                        @score_label.update @credits

                    if @credits <= C.BET
                        @addChild @gameover

        _get_reels_positions: ()->
            reels_positions = []
            for reel, reel_index in @reels
                reels_positions[reel_index] = reel.get_symbols_positions()

            return reels_positions


