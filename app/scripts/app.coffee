# global define
define ['enchantjs', 'jquery'], (enchantjs, $)->
    'use strict'

    enchant()

    $(document).ready ()->
        game = new Core 320, 320
        game.fps = 15;
        game.preload 'images/chara0.png'
        game.onload = ()->
            scene = new Scene()
            sprite = new Sprite 32, 32
            sprite.image = game.assets['images/chara0.png']
            scene.addChild sprite
            game.pushScene scene
        game.start()