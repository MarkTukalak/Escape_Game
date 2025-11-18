function love.load()
    love.window.setTitle("Escapist")
    love.window.setMode(800, 600)
    require("menu")
    initializeMenu ()
    game_state = {
        screen = "menu",
        current_room = "room1"
    }
end
function love.update(dt)

end
function love.draw()
if game_state.screen == "menu" then
        drawMenu()
    end
end
function love.mousepressed(x, y, button)

end
