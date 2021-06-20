///save_lvl(level name)
var lvl = argument[0]

var num
num = instance_number(obj_levelentry)

var grid
grid = ds_grid_create(12, num)
var ID, otype, xpos, ypos, rot, blend, alpha, xscale, yscale, tex, origin, points, rw, rh;
points = noone;

for(var i=0; i<num; i=i+1)
{
    ID = instance_find(obj_levelentry,i)
    otype = object_get_name(ID.object_index)
    xpos = ID.x
    ypos = ID.y
    rot = ID.image_angle
    blend = ID.image_blend
    alpha = ID.image_alpha
    xscale = ID.image_xscale
    yscale = ID.image_yscale
    tex = sprite_get_name(ID.sprite_index)
    if otype = object_get_name(obj_terrainobject) or ID.object_index = obj_placeobject tex = ID.texture
    if otype = object_get_name(obj_terrainobject) points = ID.points
    else if variable_instance_exists(ID,"origin") origin = ID.origin
    ds_grid_set(grid,0,i,otype)
    ds_grid_set(grid,1,i,xpos)
    ds_grid_set(grid,2,i,ypos)
    ds_grid_set(grid,3,i,rot)
    ds_grid_set(grid,4,i,blend)
    ds_grid_set(grid,5,i,alpha)
    ds_grid_set(grid,6,i,xscale)
    ds_grid_set(grid,7,i,yscale)
    if otype = object_get_name(obj_terrainobject){ds_grid_set(grid,8,i,tex)
    ds_grid_set(grid,9,i,points)}
    else if variable_instance_exists(ID,"origin")
    ds_grid_set(grid,8,i,origin)
    else ds_grid_set(grid,8,i,noone)
    if ID.object_index = obj_gameobject{ds_grid_set(grid,9,i,ID.texture);}
}
rw = room_width
rh = room_height
ds_grid_set(grid,10,0,rw)
ds_grid_set(grid,11,0,rh)

var level_data = ds_grid_write(grid)
ds_grid_destroy(grid)

var level_encoded = base64_encode(level_data)
var file = file_text_open_write(lvl+string(".chlvl"))
file_text_write_string(file,level_encoded)
file_text_close(file)

//ini_open("level.lvl")
//ini_write_string("Parts","CurrentParts",cellpartscurrent)
//ini_close()

