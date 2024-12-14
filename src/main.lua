-- function love.draw()
--    love.graphics.print("Hello World", 400, 300)
--    love.graphics.polygon('fill', 50, 0, 0, 100, 100, 100)
-- end

local current_color = {1, 1, 1, 1}

love.draw = function()
  local square = {100, 100, 100, 200, 200, 200, 200, 100}

  -- Initialize the square with the default color (white)
  love.graphics.setColor(current_color)
  -- Draw the square
  love.graphics.polygon('fill', square)
end


love.keypressed = function(pressed_key)
  if pressed_key == 'b' then
    -- Blue
    current_color = {0, 0, 1, 1}
  elseif pressed_key == 'g' then
    -- Green
    current_color = {0, 1, 0, 1}
  elseif pressed_key == 'r' then
    -- Red
    current_color = {1, 0, 0, 1}
  elseif pressed_key == 'w' then
    -- White
    current_color = {1, 1, 1, 1}
  elseif pressed_key == 'p' then
     -- Purple
     current_color = {1, 0, 1, 1}
  elseif pressed_key == 'x' then
     -- random shit
     current_color = {.2, .3, .4, .85}
  end

end
