
local current_color = {1, 1, 1, 1}
local seconds = 0

local key_map = {
  b = function()
    current_color = {0, 0, 1, 1} -- Blue
  end,
  g = function()
    current_color = {0, 1, 0, 1} -- Green
  end,
  r = function()
    current_color = {1, 0, 0, 1} -- Red
  end,
  w = function()
    current_color = {1, 1, 1, 1} -- White
  end,
  escape = function()
    love.event.quit()
  end
}

love.draw = function()
  local square = {100, 100, 100, 200, 200, 200, 200, 100}

  -- Print a counter clock
  local clock_display = 'Seconds: ' .. math.floor(seconds)
  love.graphics.print(clock_display, 0, 0, 0, 2, 2)

  -- Initialize the square with the default color (white)
  love.graphics.setColor(current_color)
  love.graphics.polygon('fill', square)
end


love.keypressed = function(pressed_key)
  -- Check in the key map if there is a function
  -- that matches this pressed key's name
  if key_map[pressed_key] then
    key_map[pressed_key]()
  end
end

love.update = function(dt)
  -- Add up all the delta time as we get it
  seconds = seconds + dt
end
