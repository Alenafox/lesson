require("vector")
require("mover")
require("rect")

function love.load() 
	width = love.graphics.getWidth()
	height = love.graphics.getHeight()
	love.graphics.setBackgroundColor(128 / 255, 128 / 255, 128 / 255)

	location = Vector:create(width / 2, height / 2)
	velocity = Vector:create(0,0)
	mover = Mover:create(location, velocity)
	wmover = Mover:create(location, velocity, 5)
	rect = Rect:create(location)
	wmover.size = 30

	wind = Vector:create(0.01, 0)
	isWind = false
	gravity = Vector:create(0, 0.01)
	isGravity = false
	floating = Vector:create(0, -0.02)
	isFloating = false
end

function love.update()
	mover:applyForce(gravity)
	wmover:applyForce(gravity)
	mover:applyForce(wind)
	wmover:applyForce(wind)

	if (mover.location.x < width / 2) then
		friction = (mover.velocity * -1):norm()
		if friction then
			friction:mul(0.005)
			mover:applyForce(friction)
		end
	end
	if (wmover.location.x < width / 2) then
		friction = (wmover.velocity):norm()
		if friction then
			friction:mul(0.005)
			wmover:applyForce(friction)
		end
	end

	mover:update()
	mover:checkBoundaries()
	wmover:update()
	wmover:checkBoundaries()
end

function love.draw()
	rect:draw()
	mover:draw()
	love.graphics.print(tostring(mover.velocity), mover.location.x + mover.size, mover.location.y)
	love.graphics.print("w: " .. tostring(isWind) .. "g: " .. tostring(isGravity) .. "f: " .. tostring(isFloating))
	
	wmover:draw()
	love.graphics.print(tostring(wmover.velocity), wmover.location.x + wmover.size, wmover.location.y)
	love.graphics.print("w: " .. tostring(isWind) .. "g: " .. tostring(isGravity) .. "f: " .. tostring(isFloating))
end

function love.keypressed(key)
end
