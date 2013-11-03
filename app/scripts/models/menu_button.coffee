define ['enchantjs'], (enchantjs)->

    MenuButton = enchant.Class.create enchant.Label,
        initialize: (caption, x, y)->
            enchant.Label.call @, caption

            @.color = 'white'
            @.font = '24px "Courier New"'
            @.moveTo x, y

            return @
