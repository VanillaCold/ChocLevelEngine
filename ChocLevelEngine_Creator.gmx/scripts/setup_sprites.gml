#define setup_sprites
///setup_sprites()

var file = file_find_first("Sprites\*.png",0);
for(var j = 0;file!="";j++)
    {
    file = file_find_next()
    }
    
global.sprites_array = array_create(j)
global.file_array = array_create(j)
global.spritenum = j


file = file_find_first("Sprites\*.png",0); 
for(var i = 0;file != "";i++)
    {
    show_debug_message(file)
    spr = sprite_add("Sprites\"+string(file),1,0,0,0,0)
    width = sprite_get_width(spr)
    height = sprite_get_height(spr)
    sprite_delete(spr)
    spr2 = sprite_add("Sprites\"+string(file),1,0,0,width/2,height/2)
    
    
    show_debug_message(spr2)
    
    if sprite_exists(spr2)
    {
    global.sprites_array[i] = spr2
    global.file_array[i] = file
    sprite_collision_mask(spr2,0,1,0,0,width,height,1,0)
    
    }
    else show_error("
    Sprites could not be registered properly.",1)
    
    file = file_find_next()
    }

#define setup_terrainsprites
///setup_terrainsprites()

var file = file_find_first("Terrain\*.png",0);
for(var j = 0;file!="";j++)
    {
    file = file_find_next()
    }
show_debug_message(j)
    
global.terrain_array = array_create(j)
global.terrain_names = array_create(j)
global.terrainnum = j


file = file_find_first("Terrain\*.png",0); 
for(var i = 0;file != "";i++)
    {
    show_debug_message(file)
    spr = sprite_add("Terrain\"+string(file),2,0,0,0,0)
    width = sprite_get_width(spr)
    height = sprite_get_height(spr)
    sprite_delete(spr)
    spr2 = sprite_add("Terrain\"+string(file),2,0,0,width/2,height/2)
    
    
    show_debug_message(spr2)
    
    if sprite_exists(spr2)
    {
    global.terrain_array[i] = spr2
    global.terrain_names[i] = file
    sprite_collision_mask(spr2,0,1,0,0,width,height,1,0)
    
    }
    else show_error("
    Terrain textures could not be registered properly.",1)
    
    file = file_find_next()
    }
