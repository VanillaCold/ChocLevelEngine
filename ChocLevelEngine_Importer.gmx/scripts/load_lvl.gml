///load_lvl(level_name)
var lvl = argument[0]

if !file_exists("levels\"+lvl+string(".chlvl")){show_error("Unable to load level - level file does not exist.",0); exit } //load in level
var file = file_text_open_read("levels\"+lvl+string(".chlvl"))
var level_encoded = file_text_read_string(file)
var level_data = base64_decode(level_encoded)
file_text_close(file)
ID = noone
var otype, xpos, ypos, rot, blend, alpha, xscale, yscale, tex, origin, points, prevTerrain;
tex = noone
points = noone
origin = noone
prevTerrain = noone
prevTerrainValue = noone //setup variables

var grid
grid = ds_grid_create(1, 1)

grid = ds_grid_read(grid,level_data) //make ds grid.

//if ds_grid_width(grid) > 1 instance_destroy(obj_levelentry)
if ds_grid_width(grid) > 1 for(var i=0; i<ds_grid_height(grid); i=i+1)
    {
    if ds_grid_get(grid,0,i) = "obj_terrainobject" or ds_grid_get(grid,0,i) = "obj_terrainpoint" //if the object isn't available to be imported yet, don't import said object.
    otype = asset_get_index(ds_grid_get(grid,0,i))
    else otype = ds_grid_get(grid,0,i)
    xpos = ds_grid_get(grid,1,i) //set variables
    ypos = ds_grid_get(grid,2,i)
    rot = ds_grid_get(grid,3,i)
    blend = ds_grid_get(grid,4,i)
    alpha = ds_grid_get(grid,5,i)
    xscale = ds_grid_get(grid,6,i)
    yscale = ds_grid_get(grid,7,i)
    if otype = obj_terrainobject
        {
        tex = ds_grid_get(grid,8,i)
        points = ds_grid_get(grid,9,i)
        }
    else
        {
        origin = ds_grid_get(grid,8,i)
        }
    
    if otype != ds_grid_get(grid,0,i)
    {
    ID = instance_create(xpos,ypos,otype) //create object and set variables
    ID.image_angle = rot
    ID.image_blend = blend
    ID.image_alpha = alpha
    ID.image_xscale = xscale
    ID.image_yscale = yscale
    show_debug_message("I = "+string(i))
    if otype = obj_terrainobject
        {
        ID.texture = tex
        ID.points = array_create(4)
        for(var ii=0;ii<4;ii++)ID.points[ii] = noone
        prevTerrain = ID
        prevTerrainValue = i
        ID.alarm[0] = 0
        }
    else if otype = obj_terrainpoint //for terrain points, set terrain-related variables.
        {
        if prevTerrain != noone
            {
            ID.origin = prevTerrain
            show_debug_message(i-prevTerrainValue-1)
            
            if i-prevTerrainValue-1 < 4
            prevTerrain.points[i-prevTerrainValue-1] = ID
            }
        }
    
    }
        if otype = "obj_gameobject" //game objects aren't supported yet but when they are, this will set a variable for them
        {
        tex = ds_grid_get(grid,9,i)
        show_debug_message(tex);
        if object_exists(asset_get_index(tex))
        instance_create(xpos,ypos,asset_get_index(tex));
        }
    }
    if ds_grid_width(grid) >10 //set room size
        {
        rw = ds_grid_get(grid,10,0)
        rh = ds_grid_get(grid,11,0)
        room_width = rw
        room_height = rh
        room_set_width(room,rw)
        room_set_height(room,rh)
        show_debug_message(rw)
        show_debug_message(rh)
        }
        
    
    ds_grid_destroy(grid)

