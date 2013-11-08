define ['enchantjs'], (enchantjs)->

    ActionButton = enchant.Class.create enchant.Label,
        initialize: (caption, x, y)->
            enchant.Label.call @, caption

            @.color = 'white'
            @.font = '42px "Courier New"'
            @.moveTo x, y

            return @
