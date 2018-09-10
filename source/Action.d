module stratd.Action;

import stratd;

/**
 * A class which denotes an action
 */
abstract class Action {

    string name; ///The name of this action
    Game game; ///The game containig this action

    /**
     * Constructs a new action with the given name
     * and given game containing it
     */
    this(string name, Game game) {
        this.name = name;
        this.game = game;
    }

    /**
     * Performs the action
     */
    abstract void perform();

    /**
     * Performs the action from a query
     * Uses whatever the query resulted in, 
     * either a coordinate or a string
     * Not all actions use queries, so
     * it is an optional override
     */
    void performAfterQuery(Coordinate target, string str="") {}

    /**
     * Sets a query to the contained display
     * For internal use only
     */
    void setQuery(Query query) {
        this.game.setQuery(query);
    }

}