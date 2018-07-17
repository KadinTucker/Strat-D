module stratd.World;

import stratd;

/** 
 * A world in which to play the game
 * Contains a two-dimensional array of tiles
 * that can be searched
 * World generation algorithms should be made
 * by creating a subclass and implementing new constructor(s)
 */
class World {

    private Tile[][] _tiles; ///The array of tiles that compose the world

    /**
     * Default constructor for the world
     * Fills in the world with uniform tiles
     * such that it is size nrows by ncols
     */
    this(int nrows, int ncols) {
        for(int x = 0; x < nrows; x++) {
            _tiles ~= null;
            for(int y = 0; y < ncols; y++) {
                _tiles[x] ~= new Tile(new Coordinate(x, y), this, null);
            }
        }
    }

    /**
     * Gets the width of the world 
     */
    @property int width() {
        return this._tiles.length;
    }

    /**
     * Gets the height of the world
     */
    @property int height() {
        return (this._tiles.length > 0)? this._tiles[0].length : 0;
    }

    /**
     * Gets the tile at the given coordinate
     * Returns null if the given coordinate is outside of the world
     */
    Tile getTileAt(Coordinate location) {
        return this.getTileAt(location.x, location.y);
    }

    Tile getTileAt(int x, int y) {
        if(x >= this._tiles.length || x <= 0 || y >= this._tiles[x].length || y <= 0) {
            return null;
        }
        return this._tiles[x][y];
    }

}