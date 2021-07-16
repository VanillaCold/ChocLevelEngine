# Choc's Level Engine  
A level creation system for GameMaker Studio 1.4.  


Choc's Level Engine provides a simple way to create levels for GameMaker: Studio 1.4 games.  
Instead of manually tiling a level's terrain, this tool has Terrain Objects: 
+ These consist of four points with which a quadrilateral gets drawn.
+ Said points can easily be moved just by left-clicking them.
+ Pressing the Shift key while the mouse is hovering over a terrain object will let you change its texture.
+ Pressing the 1 key will toggle a 16x16 grid - when enabled, all terrain points and objects will snap to this grid when moved.
+ Pressing the 0 key will toggle "Snap Mode" - when enabled, terrain points will snap to each other when moved, if they're close enough.

In addition to this, you can also place objects using this tool as well.  
Why? Simple: since the GameMaker: Studio room editor can't read the level's terrain, it'd be difficult to place objects into your level.
+ When placing in an object, it asks you what the object's name is - if a custom sprite matches this name, it uses said sprite in the editor.
+ Pressing the Shift key while the mouse is hovering over a terrain object will let you change the object name.

In the future, there will also be Decals - they will do nothing but can be used decorate your level.


**Custom Texture Support**  
The ability to use custom textures for terrain and objects wouldn't work without a way to import them.  
That's why the Choc Level Editor has support for both of these - simply place your texture in `ChocLevelEngine_Creator\Sprites` or `ChocLevelEngine_Creator\Terrain` and the level editor will do the rest.  
When using custom textures in your own game, terrain objects looks for a sprite with the same name as your texture and regular objects just use the sprite that you defined in GameMaker: Studio.
