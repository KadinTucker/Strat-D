module stratd.StratdComponent;

import stratd;

/**
 * A component that works with the stratd architecture
 * Uses the stratd game class
 * All other stratd components use this as a super class
 */
abstract class StratdComponent : Component {

    iRectangle _location; ///The location of the component in the window
    Color _bgColor; ///The background color to draw
    Surface _bgSurface; ///A surface to tesselate across the background of the component
    Game _game; ///The game in which this component is located
    Texture drawTexture; ///The texture to draw to the screen displaying the map

    /**
     * Constructs a new stratd component, in the given display
     * and at the given location
     */
    this(Display container, iRectangle location, Color bgColor=Color(0, 0, 0), Surface bgSurface=null) {
        super(container);
        this._location = location;
        this._bgColor = bgColor;
        this._bgSurface = bgSurface;
        this.updateTexture();
    }

    /**
     * Getter and setter properties
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

    @property Game game() {
        return this._game;
    }

    /**
     * Draws the component to the screen
     */
    override void draw() {
        this.container.renderer.drawColor = this._bgColor;
        this.container.renderer.clear();
        this.container.renderer.drawColor = Color(0, 0, 0);
        if(this.drawTexture !is null) {
            this.container.renderer.copy(this.drawTexture, this._location);
        }
    }

    /**
     * No default implementation for handling events
     */
    void handleEvent(SDL_Event event) {
    }

    /**
     * Gets the surface that makes up the background of the component
     */
    Surface getBackgroundSurface() {
        Surface baseSurface = new Surface(this._location.extent.x, this._location.extent.y, SDL_PIXELFORMAT_RGBA32);
        if(this.bgSurface !is null) {
            for(int x = 0; x < this.container.window.size.x / this.bgSurface.dimensions.x + 1; x++) {
                for(int y = 0; y < this.container.window.size.y / this.bgSurface.dimensions.y + 1; y++) {
                    baseSurface.blit(this.bgSurface, null, this.bgSurface.dimensions.x * x, this.bgSurface.dimensions.y * y);
                }
            }
        }
        return baseSurface;
    }

    /**
     * Updates the draw texture of the component
     */
    abstract void updateTexture();

}