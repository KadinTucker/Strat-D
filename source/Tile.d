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
 */
class Tile {

    private TileElement _element; ///An element that may be contained on this tile; if empty, this is null
    private Coordinate _location; ///The coordinate location of the tile
    private World _world; ///The world in which the tile is found

    /**
     * Constructs a new tile at the given location in the given world
     */
    this(Coordinate location, World world) {
        this._location = location;
        this._world = world;
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

}