define ['enchantjs'], (enchantjs)->

    TitleScene = enchant.Class.create enchant.Scene,
        initialize: ()->
            enchant.Scene.call(@)

            @.backgroundColor = 'black'

            title = new Label 'Funky Slots'
            title.color = 'white'
            title.font = '20px "Courier New"'
            title.moveTo 100, 150
            @.addChild title

            return @