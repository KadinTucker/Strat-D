module stratd.TileElement;

import stratd;

/**
 * An element that occupies a tile
 * Tiles can contain elements,
 * elements contain their containing tile
 */
class TileElement {

    private Tile _tile; ///The tile containing this element

    /**
     * Constructs a new tile element
     * in the given tile
     */
    this(Tile tile) {
        this._tile = tile;
    }

    /**
     * Getter and setter properties
     */ 
    @property Tile tile() {
        return this._tile;
    }
    @property void tile(Tile tile) {
        this._tile = tile;
    }

}