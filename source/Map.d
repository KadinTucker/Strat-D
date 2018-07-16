module stratd.Map;

import d2d;

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

    private iRectangle _location; ///The location of the map in the window
    private Color _bgColor; ///The background color to draw
    private Surface _bgSurface; ///A surface to tesselate across the background of the map
    private MapDrawMode _drawMode; ///The draw mode of the map (see enum above)

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
        this._drawMode = drawMode;
    }

    /**
     * What happens when events happen to the map
     */
    void handleEvent(SDL_Event event) {
    }

}