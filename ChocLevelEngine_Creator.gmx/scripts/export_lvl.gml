#define export_lvl
///export_lvl(level name)

var lvl = argument[0]

var num = instance_number(obj_levelentry)

var bgsurf = surface_create(room_width,room_height)
var terrainsurf = surface_create(room_width,room_height)
var fgsurf = surface_create(room_width,room_height)

surface_set_target(bgsurf)

//BG decals
export_lvl_surf(obj_decal)
surface_save(bgsurf,working_directory+string("Exports\")+string(lvl)+string("_decals.png"))
surface_free(bgsurf)

//Terrain
surface_set_target(terrainsurf)

export_lvl_surf(obj_terrainobject)
surface_save(terrainsurf,working_directory+string("Exports\")+string(lvl)+string("_terrain.png"))
surface_free(terrainsurf)

//BG terrain
//surface_set_target(fgsurf)

//export_lvl_surf(obj_fgdecal)
//surface_save(fgsurf,working_directory+string("Exports\")+string(lvl)+string("_foreground.png"))
//surface_free(fgsurf)


#define export_lvl_surf
///export_lvl_surf(object_to_export)

var obj = argument[0]

for(var i = 50;i>-51;i-=1)
    {
    //find instances
    for(var j = instance_number(obj)-1;j>-1;j-=1)
        {
        inst = instance_find(obj,j)
        //if instance depth matches that of previous loop, draw it
        if inst.depth = i
            {
            texture_set_interpolation(false)
            with(inst){event_perform(ev_draw,0);}
            
            }
        }
    }