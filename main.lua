local config = { circle = { radius = 10, speed = 100 }, 
  keys = { left = "a", down = "s", up = "w", right = "d" } }

local thecircle = { x = 200, y = 200 }
local state = { keys = { left = false, down = false, up = false, right = false } }

love.load = function()
	love.window.setTitle("circle")
	love.window.setMode(800, 600, {resizable=true, vsync=-1})
	love.graphics.setBackgroundColor(8/256, 16/256, 32/256)
end

love.keypressed = function(key, scancode, isrepeat)
	    if key == config.keys.left  then state.keys.left  = true
	elseif key == config.keys.down  then state.keys.down  = true
	elseif key == config.keys.up    then state.keys.up    = true
	elseif key == config.keys.right then state.keys.right = true end
end

love.keyreleased = function(key, scancode)
	    if key == config.keys.left  then state.keys.left  = false
	elseif key == config.keys.down  then state.keys.down  = false
	elseif key == config.keys.up    then state.keys.up    = false
	elseif key == config.keys.right then state.keys.right = false end
end

love.update = function(dt)
	if (state.keys.left and state.keys.right) or
	  (state.keys.down and state.keys.up) then return end
	
	if state.keys.left  then thecircle.x =
	  thecircle.x - config.circle.speed * dt end
	if state.keys.down  then thecircle.y =
	  thecircle.y + config.circle.speed * dt end
	if state.keys.up    then thecircle.y =
	  thecircle.y - config.circle.speed * dt end
	if state.keys.right then thecircle.x =
	  thecircle.x + config.circle.speed * dt end

end

love.draw = function()
	love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 0, 0)
	love.graphics.circle("fill", thecircle.x, thecircle.y, config.circle.radius)
end

