module stratd.Tile;

import stratd;

/**
 * A coordinate location, with two dimensions, x and y
 */
class Coordinate {

    int x;
    int y;

    this(int x, int y) {
        this.x = x;
        this.y = y;
    }

}

/**
 * A tile to be found in the world
 * Has a default implementation but supports more advanced functions
 */
class Tile {

    private TileElement _element; ///An element that may be contained on this tile; if empty, this is null
    private Coordinate _location; ///The coordinate location of the tile
    private World _world; ///The world in which the tile is found
    private Surface _image; ///The image with which to draw the tile

    /**
     * Constructs a new tile at the given location in the given world
     */
    this(Coordinate location, World world, Surface image) {
        this._location = location;
        this._world = world;
        this._image = image;
    }

    /**
     * Getter and setter properties
     */ 
    @property TileElement element() {
        return this._element;
    }
    @property void element(TileElement element) {
        this._element = element;
    }

    @property Coordinate location() {
        return this._location;
    }
    @property void location(Coordinate location) {
        this._location = location;
    }

    @property World world() {
        return this._world;
    }

    @property Surface image() {
        return this._image;
    }
    @property void image(Surface image) {
        this._image = image;
    }

    /**
     * What happens when the tile gets stepped on
     */
    void getSteppedOn(TileElement stepper){
    }

}