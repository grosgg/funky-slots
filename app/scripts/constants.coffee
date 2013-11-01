define [], ()->
    CONSTANTS =
        SCREEN_WIDTH : 320
        SCREEN_HEIGHT : 320
        FPS : 30

        GAME_BET : 10
        MAX_BET : 1000

        SYMBOL_WIDTH : 16
        SYMBOL_HEIGHT : 16

        REEL_SPEED : 20

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

    CONSTANTS.REEL_BASE = [
        CONSTANTS.SYMBOL_CHERRY
        CONSTANTS.SYMBOL_CHERRY
        CONSTANTS.SYMBOL_CHERRY
        CONSTANTS.SYMBOL_WATERMELON
        CONSTANTS.SYMBOL_WATERMELON
        CONSTANTS.SYMBOL_GRAPE
        CONSTANTS.SYMBOL_GRAPE
        CONSTANTS.SYMBOL_BANANA
        CONSTANTS.SYMBOL_PIG
        CONSTANTS.SYMBOL_STAR
    ]

    CONSTANTS.REEL_HEIGHT = CONSTANTS.REEL_BASE.length * CONSTANTS.SYMBOL_HEIGHT

    return CONSTANTS