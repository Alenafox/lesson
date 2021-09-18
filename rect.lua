Rect = {}
Rect.__index = Rect

function Rect:create(location)
    local rect = {}
    setmetatable(rect, Rect)
    rect.location = location
    rect.size = 100
    return rect
end

function Rect:draw()
    love.graphics.setColor(28 / 255, 28 / 255, 28 / 255)
    love.graphics.rectangle("fill", self.location.x, self.location.y, width, height)
end
