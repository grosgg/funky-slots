# global define
define [
    'jquery'
    'underscore'
    'enchantjs'
    'constants'
    'scenes/title'
    'scenes/game'
], ($, _, enchantjs, C, TitleScene, GameScene)->

    'use strict'

    enchant()

    $(document).ready ()->
        game = new Core C.SCREEN_WIDTH, C.SCREEN_HEIGHT
        game.fps = C.FPS;
        game.preload 'images/bg.png', 'images/icon0.png', 'sounds/click.wav'

        game.onload = ()->
            titleScene = new TitleScene(game)

            game.addEventListener 'gameover', ()->
                game.pushScene titleScene
                game.removeScene @gameScene

            game.addEventListener 'easy', ()->
                game.reel_speed = C.REEL_SPEED_EASY
                @gameScene = new GameScene(game)
                game.pushScene @gameScene

            game.addEventListener 'medium', ()->
                game.reel_speed = C.REEL_SPEED_MEDIUM
                @gameScene = new GameScene(game)
                game.pushScene @gameScene

            game.addEventListener 'hard', ()->
                game.reel_speed = C.REEL_SPEED_HARD
                @gameScene = new GameScene(game)
                game.pushScene @gameScene

            game.pushScene titleScene
        game.start()