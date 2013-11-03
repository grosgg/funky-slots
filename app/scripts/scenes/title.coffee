define [
    'enchantjs'
    'models/menu_button'
], (enchantjs, MenuButton)->

    TitleScene = enchant.Class.create enchant.Scene,
        initialize: (game)->
            enchant.Scene.call(@)

            @.backgroundColor = 'black'

            title = new Label 'Funky Slots'
            title.color = 'white'
            title.font = '40px "Courier New"'
            title.moveTo 30, 40
            @addChild title

            easy = new MenuButton 'EASY', 130, 160
            easy.addEventListener 'touchend', ()=>
                game.dispatchEvent(new Event('easy'))
            @addChild easy

            medium = new MenuButton 'MEDIUM', 115, 200
            medium.addEventListener 'touchend', ()=>
                game.dispatchEvent(new Event('medium'))
            @addChild medium

            hard = new MenuButton 'HARD', 130, 240
            hard.addEventListener 'touchend', ()=>
                game.dispatchEvent(new Event('hard'))
            @addChild hard

            return @