# global define
define ['enchantjs', 'jquery', 'pig'], (enchantjs, $, Pig)->
    'use strict'

    enchant()

    $(document).ready ()->
        game = new Core 320, 320
        game.fps = 30;
        game.preload 'images/icon0.png', 'sounds/pig.wav'
        game.onload = ()->
            scene = new Scene()

            pig = new Pig 48, 128, game, scene
            scene.addChild pig

            game.pushScene scene
        game.start()