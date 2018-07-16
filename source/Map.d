module stratd.Map;

import d2d;
import stratd;

immutable int tileWidth = 50; //Temporary, until tile textures are established

/**
 * An enumeration of the map draw modes
 * By default, the map draws with flat mode
 */
enum MapDrawMode {
    FLAT=0,
    ISOMETRIC=1
} 

/**
 * A component which displays the world map to the screen
 * The world map consists of a rectangular grid of tiles,
 * and can be drawn isometrically or by birds eye view
 */
class Map : StratdComponent {

    private World _world; ///The world this map is drawing
    private MapDrawMode _drawMode; ///The draw mode of the map (see enum above)
    private Tile _selectedTile; ///The selected tile on the map

    /**
     * Constructs a new map in the given d2d display
     * At the given location with some other optional arguments
     */
    this(Display container, iRectangle location, World world, Color bgColor=Color(0, 0, 0), Surface bgSurface=null) {
        super(container, location, bgColor, bgSurface);
        this._world = world;
    }

    /**
     * Getter and setter properties: 
     */
    @property World world() {
        return this._world;
    }
    @property void world(World world) {
        this._world = world;
    }

    @property MapDrawMode drawMode() {
        return this.drawMode;
    }
    @property void drawMode(MapDrawMode drawMode) {
        this.updateTexture();
        this._drawMode = drawMode;
    }

    @property Tile selectedTile() {
        return this._selectedTile;
    }
    @property void selectedTile(Tile selected) {
        this._selectedTile = selected;
    }

    /**
     * Compiles together the map texture to be drawn
     * Draws it based on the draw mode of the map
     */
    override void updateTexture() {
        Surface baseSurface = this.getBackgroundSurface();
        if(this.drawMode == MapDrawMode.FLAT) {
            for(int x = 0; x < this._world.width; x++) {
                for(int y = 0; y < this._world.height; y++) {
                    //TODO
                }
            }
        }
        this.drawTexture = new Texture(baseSurface, this.container.renderer);
    }

}