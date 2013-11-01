define ['enchantjs'], (enchantjs)->

    Pig = enchant.Class.create enchant.Sprite,
        initialize: (x, y, game, scene)->
            enchant.Sprite.call(@, 16, 16);
            @x = x
            @y = y
            @image = game.assets['images/icon0.png']
            @frame = 22
            @x_dir = 'right'
            @y_dir = 'down'
            @scale 4

            @.addEventListener 'enterframe', ()=>
                if @.x <= 16 || @.x >= 272
                    game.assets['sounds/pig.wav'].play()
                    @.changeDirection 'x'
                if @.y <= 16 || @.y >= 272
                    game.assets['sounds/pig.wav'].play()
                    @.changeDirection 'y'

                if @.x_dir == 'right'
                    @.x += 3
                else
                    @.x -= 3
                
                if @.y_dir == 'down'
                    @.y += 2
                else
                    @.y -= 2

            @.addEventListener 'touchstart', ()=>
                scene.removeChild(@);

            return @

        changeDirection: (axis)->
            if axis == 'x'
                if @x_dir == 'right'
                    @x_dir = 'left'
                else
                    @x_dir = 'right'
            if axis == 'y'
                if @y_dir == 'down'
                    @y_dir = 'up'
                else
                    @y_dir = 'down'