local Bird = import('..views.bird')

local MenuScene = class('MenuScene', function()
    return display.newScene('MenuScene')
end)

function MenuScene:ctor()
    self:loadBackground()
    self:loadGround()
    self.batch = display.newBatchNode(TEXTURES_IMAGE_FILENAME)
    self:addChild(self.batch)
    self:loadTitle()
    self:loadBird()
    self:loadStartButton()
    self:loadGradeButton()
end

function MenuScene:loadBackground()
    self.bg = display.newSprite(BACKGROUND_FILENAME, display.cx, display.cy)
    self:addChild(self.bg)
end

function MenuScene:loadGround()
    self.ground = display.newSprite(GROUND_FILENAME, display.cx, display.bottom)
    self:addChild(self.ground)
    self:moveGround()
end

function MenuScene:moveGround()
    self.ground:runAction(
        CCRepeatForever:create(
            transition.sequence({
                CCMoveTo:create(0.5, ccp(display.cx - 60, display.bottom)),
                CCMoveTo:create(0, ccp(display.cx, display.bottom))
            })
        )
    )
end

function MenuScene:loadTitle()
    local title = display.newSprite('#flappybird.png')
    title:setPosition(display.width / 2, display.height - display.height / 3)
    local ratio = (display.width * 2 / 3) / title:getContentSize().width
    title:setScaleX(ratio)
    title:setScaleY(ratio)
    self.batch:addChild(title)
end

function MenuScene:loadBird()
    self.bird = Bird.new()
    self.bird:setPosition(display.width / 2, display.height / 2)
    self.bird:flap()
    self.bird:flyUpAndDown()
    self.batch:addChild(self.bird)
end

function MenuScene:loadStartButton()
    local button = display.newSprite('#start.png')
    button:setPosition(display.width - 3 * display.width / 4, 170)
    button:setScaleX(0.5)
    button:setScaleY(0.5)
    self.batch:addChild(button)
end

function MenuScene:loadGradeButton()
    local button = display.newSprite('#grade.png')
    button:setPosition(display.width - 1 * display.width / 4, 170)
    button:setScaleX(0.5)
    button:setScaleY(0.5)
    self.batch:addChild(button)
end
return MenuScene