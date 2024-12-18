
local world = love.physics.newWorld(0, 100)

-- Triangle is the name of our first entity
local triangle = {}
triangle.body = love.physics.newBody(world, 200, 200, 'dynamic')
-- Give the triangle some weight
triangle.body.setMass(triangle.body, 32)
triangle.shape = love.physics.newPolygonShape(100, 100, 200, 100, 200, 200)
triangle.fixture = love.physics.newFixture(triangle.body, triangle.shape)
triangle.fixture:setRestitution(0.75)

-- Another entity
local bar = {}
bar.body = love.physics.newBody(world, 200, 450, 'static')
bar.shape = love.physics.newPolygonShape(0, 0, 0, 20, 400, 20, 400, 0)
bar.fixture = love.physics.newFixture(bar.body, bar.shape)


-- Boolean to keep track of whether our game is paused or not
local paused = false

local key_map = {
   escape = function()
      love.event.quit()
   end,
   space = function()
      paused = not paused
   end
}

love.draw = function()
   love.graphics.polygon('line', triangle.body:getWorldPoints(triangle.shape:getPoints()))
   love.graphics.polygon('line', bar.body:getWorldPoints(bar.shape:getPoints()))
end

love.keypressed = function(pressed_key)
   -- Check in the key map if there is a function
   -- that matches this pressed key's name
   if key_map[pressed_key] then
      key_map[pressed_key]()
   end
end

love.update = function(dt)
   -- Note that this : syntax is kind of shorthand to avoid
   -- having to put selfs manually into table function calls
   -- its in a way the syntax for methods rather than functions
   if not paused then
      world:update(dt)
   end
end

