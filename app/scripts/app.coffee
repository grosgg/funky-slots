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
        game.preload 'images/icon0.png', 'images/slot_top.gif', 'images/slot_bottom.gif', 'sounds/click.wav'
        game.onload = ()->
            titleScene = new TitleScene()
            gameScene = new GameScene(game)

            titleScene.addEventListener 'touchend', ()->
                game.pushScene gameScene
            game.pushScene titleScene
        game.start()