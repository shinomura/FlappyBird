-- frame
require('framework.init')
require('framework.shortcodes')
require('framework.cc.init')

-- App
require('config')

local App = class('App', cc.mvc.AppBase)

function App:ctor()
    App.super.ctor(self)
    self.objects_ = {}
end

function App:run()
    self:loadResource()
    self:enterMenuScene()
end

function App:loadResource()
    CCFileUtils:sharedFileUtils():addSearchPath(
        RESOURCE_DIR
    )

    display.addSpriteFramesWithFile(
        TEXTURES_DATA_FILENAME,
        TEXTURES_IMAGE_FILENAME
    )

    for _, file in ipairs(SFX) do
        audio.preloadSound(file)
    end
end

function App:enterMenuScene()
    audio.playEffect(SFX.swoosh)
    self:enterScene("MenuScene", nil, "fade", 0.6, display.COLOR_WHITE)
end

function App:enterGameScene()
    audio.playEffect(SFX.swoosh)
    self:enterScene("GameScene", nil, "fade", 0.6, display.COLOR_WHITE)
end

return App
