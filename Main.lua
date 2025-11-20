function love.load()
    love.window.setTitle("Escapist")
    love.window.setMode(800, 600)
    require("menu")
    require("Rooms")
    initializeMenu ()
    initializeRooms()
    game_state = {
        screen = "game",
        current_room = "room1"
    }
    hoverObject = nil
end
function love.update(dt)
if game_state.screen == "game" then
    hoverObject = nil
    local currentRoom = rooms[game_state.current_room]
    for _, object in ipairs(currentRoom.objects) do
        if checkCollision(love.mouse.getX(), love.mouse.getY(), object.x, object.y, object.wdith, object.height) then
            hoverObject = object
        end
    end
end
end
function love.draw()
if game_state.screen == "menu" then
        drawMenu()
        elseif game_state.screen == "game" then
        drawGame()
    end
end
function love.mousepressed(x, y, button)

end
function drawGame()
    local room = rooms[game_state.current_room]
    love.graphics.clear(room.BackgroundColor)
    for _, object in ipairs(room.objects) do
        love.graphics.setColor(object.color)
        love.graphics.rectangle("fill", object.x, object.y, object.wdith, object.height)
    end
    if hoverObject then
        love.graphics.setColor(1, 1, 1)
        love.graphics.print(hoverObject.description, 10, 10)
        love.graphics.rectangle("fill", hoverObject.x, hoverObject.y, hoverObject.wdith, hoverObject.height)
    end
end
function checkCollision(ax, ay, bx, by, bw, bh)
    return ax >= bx and ax <= bx + bw and
           ay >= by and ay <= by + bh
end
function love.mousepressed(x, y, button)
    if button == 1  then
        if game_state.screen == "game" then 
            if hoverObject then
                hoverObject:onClick()
            end
        end
    end
end 