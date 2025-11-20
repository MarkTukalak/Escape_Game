rooms = {}
function initializeRooms()
    rooms.room1 = {
        name = "room 1",
        BackgroundColor = {0, 1, 0},
        objects= {}
    }
local purplebox = {
    name = "Purple Box",
    description = "A Purple Box",
    x = 150,
    y = 300,
    wdith = 30,
    height = 60,
    color = {140, 0, 191},
    onClick = function(self)
        game_state.current_room = "room2"
    end
        
        
    
}
table.insert(rooms.room1.objects, purplebox)
local bluebox = {
    name = "Blue Box",
    description = "A Blue Box",
    x = 150,
    y = 200,
    wdith = 30,
    height = 60,
    color = {0, 0, 255},
    onClick = function(self)
        print("You clicked the blue box!")
    end
        
    
}
table.insert(rooms.room1.objects, bluebox)
rooms.room2 = {
        name = "room 2",
        BackgroundColor = {1, 0, 0},
        objects= {}
    }
end