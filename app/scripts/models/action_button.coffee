define ['enchantjs'], (enchantjs)->

    ActionButton = enchant.Class.create enchant.Label,
        initialize: (caption, x, y)->
            enchant.Label.call @, caption

            @.color = 'white'
            @.font = '14px "Courier New" bold'
            @.moveTo x, y

            return @
