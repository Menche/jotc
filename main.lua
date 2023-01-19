love.load = function()
	love.window.setTitle("circle")
	love.window.setMode(800, 600, {resizable=true, vsync=-1})
	love.graphics.setBackgroundColor(8/256, 16/256, 32/256)
end

love.update = function(dt)
end

love.draw = function()
	love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 0, 0)
end

