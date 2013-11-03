define ['enchantjs'], (enchantjs)->

    InfoLabel = enchant.Class.create enchant.Label,
        initialize: (label, x, y)->
            enchant.Label.call @, label

            @.color = 'white'
            @.font = '24px "Courier New"'
            @.moveTo x, y
            @label = label
            return @

        update: (info)->
            @.text = @label + info