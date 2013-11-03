define ['enchantjs'], (enchantjs)->

    ScoreLabel = enchant.Class.create enchant.Label,
        initialize: (x, y)->
            enchant.Label.call @, 'SCORE: '

            @.color = 'white'
            @.font = '20px "Courier New" bold'
            @.moveTo x, y
            return @

        update: (score)->
            @.text = 'SCORE: ' + score