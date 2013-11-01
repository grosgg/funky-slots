define [], ()->
    constants =
        SCREEN_WIDTH : 320
        SCREEN_HEIGHT : 320
        FPS : 30

        GAME_BET : 10
        MAX_BET : 1000

        SYMBOL_WIDTH : 16
        SYMBOL_HEIGHT : 16

        REEL_SPEED : 15

        FRAME_CHERRY : 27
        FRAME_WATERMELON : 29
        FRAME_GRAPE : 17
        FRAME_BANANA : 16
        FRAME_PIG : 22
        FRAME_STAR : 30

        SYMBOL_CHERRY : 0
        SYMBOL_WATERMELON : 1
        SYMBOL_GRAPE : 2
        SYMBOL_BANANA : 3
        SYMBOL_PIG : 4
        SYMBOL_STAR : 5

    constants.REEL_BASE = [
        constants.SYMBOL_CHERRY
        constants.SYMBOL_CHERRY
        constants.SYMBOL_CHERRY
        constants.SYMBOL_WATERMELON
        constants.SYMBOL_WATERMELON
        constants.SYMBOL_GRAPE
        constants.SYMBOL_GRAPE
        constants.SYMBOL_BANANA
        constants.SYMBOL_PIG
        constants.SYMBOL_STAR
    ]

    return constants