 //DEFINING GLOBALS

#region MOVEMENT
movement_keys = [ "W", "A", "S", "D" ];
movement_speed = 1.25
directions = [ [0, -1], [-1, 0], [0, 1], [1, 0] ];
velocity_x = 0;
velocity_y = 0;
#endregion

#region ANIMATIONS
//Movement sprite
anm_move = Player1_moving;
//Idle sprite
anm_idle = Player1_idle;
#endregion

#region COLLISIONS
collision_layer_id = layer_get_id("tiles_collision")
collision_layer = layer_tilemap_get_id(collision_layer_id)
#endregion

#region Lantern
//fuel = 50
//lanternlite = 30
#endregion