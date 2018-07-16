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
class Map : Component {

    private World _world; ///The world this map is drawing
    private iRectangle _location; ///The location of the map in the window
    private Color _bgColor; ///The background color to draw
    private Surface _bgSurface; ///A surface to tesselate across the background of the map
    private MapDrawMode _drawMode; ///The draw mode of the map (see enum above)
    private Texture drawTexture; ///The texture to draw to the screen displaying the map

    /**
     * Constructs a new map in the given d2d display
     * At the given location with some other optional arguments
     */
    this(Display container, iRectangle location, Color bgColor=Color(0, 0, 0), Surface bgSurface=null) {
        super(container);
        this._location = location;
        this._bgColor = bgColor;
        this._bgSurface = bgSurface;
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

    override @property iRectangle location() {
        return this._location;
    }
    @property void location(iRectangle location) {
        this._location = location;
    }

    @property Color bgColor() {
        return this._bgColor;
    }
    @property void bgColor(Color bgColor) {
        this._bgColor = bgColor;
    }

    @property Surface bgSurface() {
        return this._bgSurface;
    }
    @property void bgSurface(Surface bgSurface) {
        this._bgSurface = bgSurface;
    }

    @property MapDrawMode drawMode() {
        return this.drawMode;
    }
    @property void drawMode(MapDrawMode drawMode) {
        this.setMapTexture();
        this._drawMode = drawMode;
    }

    /**
     * Draws the map to the screen
     */
    override void draw() {
        this.container.renderer.drawColor = this._bgColor;
        this.container.renderer.clear();
        this.container.renderer.drawColor = Color(0, 0, 0);
        this.container.renderer.copy(this.drawTexture, 0, 0);
    }

    /**
     * What happens when events happen to the map
     */
    void handleEvent(SDL_Event event) {
    }

    /**
     * Compiles together the map texture to be drawn
     * Draws it based on the draw mode of the map
     */
    void setMapTexture() {
        Surface baseSurface = new Surface(this._world.width * tileWidth, this._world.height * tileWidth, SDL_PIXELFORMAT_RGBA32);
        //Draws background image(s) first
        for(int x = 0; x < this.container.window.size.x / this.bgSurface.dimensions.x + 1; x++) {
            for(int y = 0; y < this.container.window.size.y / this.bgSurface.dimensions.y + 1; y++) {
                baseSurface.blit(this.bgSurface, null, this.bgSurface.dimensions.x * x, this.bgSurface.dimensions.y * y);
            }
        }
        //Draws tiles of the map
        if(this.drawMode == MapDrawMode.FLAT) {
            for(int x = 0; x < this._world.width; x++) {
                for(int y = 0; y < this._world.height; y++) {
                    //TODO
                }
            }
        }
        //Sets the texture
        this.drawTexture = new Texture(baseSurface, this.container.renderer);
    }

}