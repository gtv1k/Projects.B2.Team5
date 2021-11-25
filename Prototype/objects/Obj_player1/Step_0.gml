 #region MOVEMENT
//Character speed cap
//speed = clamp(speed, 0, movement_speed);

//Resetting velocities
velocity_x = 0
velocity_y = 0

//Iterating for each movement key
for (var i = 0; i < array_length_1d(movement_keys); i += 1)
{
	//Checking for keyboard input (WASD)
    if (keyboard_check(ord(movement_keys[ i ])))
    {
		//Storing velocity in variables
		velocity_x += directions[i][0] * movement_speed //Accessing nested array (array[which array][value in that array])
		velocity_y += directions[i][1] * movement_speed
    }
}
#endregion

#region ANIMATIONS
//Checking for movement input
if (velocity_x != 0 || velocity_y != 0)
{
	//Changing to running sprite
    sprite_index = Player1_moving
}
else
{
	//Changing to idle sprite
    sprite_index = Player1_idle
}

//Flipping sprite according to direction
if (velocity_x < 0)
{
    image_xscale = -1
}

if (velocity_x > 0)
{
    image_xscale = 1
}
#endregion

#region COLLISIONS
#region Right side collision check
if (tilemap_get_at_pixel(collision_layer, bbox_right + velocity_x, y) != 0)
{
	velocity_x = 0
}
if (tilemap_get_at_pixel(collision_layer, bbox_right + velocity_x, bbox_top) != 0)
{
	velocity_x = 0
}
if (tilemap_get_at_pixel(collision_layer, bbox_right + velocity_x, bbox_bottom) != 0)
{
	velocity_x = 0
}
#endregion

#region Left side collision check
if (tilemap_get_at_pixel(collision_layer, bbox_left + velocity_x, y) != 0)
{
	velocity_x = 0
}
if (tilemap_get_at_pixel(collision_layer, bbox_left + velocity_x, bbox_top) != 0)
{
	velocity_x = 0
}
if (tilemap_get_at_pixel(collision_layer, bbox_left + velocity_x, bbox_bottom) != 0)
{
	velocity_x = 0
}
#endregion

#region Top side collision check
if (tilemap_get_at_pixel(collision_layer, x, bbox_top + velocity_y) != 0)
{
	velocity_y = 0
}
if (tilemap_get_at_pixel(collision_layer, bbox_left, bbox_top + velocity_y) != 0)
{
	velocity_y = 0
}
if (tilemap_get_at_pixel(collision_layer, bbox_right, bbox_top + velocity_y) != 0)
{
	velocity_y = 0
}
#endregion

#region Bottom side collision check
if (tilemap_get_at_pixel(collision_layer, x, bbox_bottom + velocity_y) != 0)
{
	velocity_y = 0
}
if (tilemap_get_at_pixel(collision_layer, bbox_left, bbox_bottom + velocity_y) != 0)
{
	velocity_y = 0
}
if (tilemap_get_at_pixel(collision_layer, bbox_right, bbox_bottom + velocity_y) != 0)
{
	velocity_y = 0
}
#endregion
#endregion

#region Moving the player character by the velocity
x += velocity_x
y += velocity_y
#endregion