module stratd.Query;

import stratd;

/**
 * A class which tries to take an input from the user
 */
abstract class Query {

    int action; ///The action performed once the query is fulfilled; TODO: implement actions
    Game game; ///The game from which this query is taken
    bool isFulfilled; ///Whether or not this query is fulfilled

    /**
     * Constructs a new query with the given action
     * in the given game
     */
    this(int action, Game game) {
        this.action = action;
        this.game = game;
    }

    /**
     * Cancels the query
     */
    void cancel() {
        this.isFulfilled = true;
    }

    /**
     * Tries to get input from the user to fulfil the query
     */
    abstract void ask(SDL_Event event);

    /**
     * Indicates that the query is being made on the display
     */
    abstract void indicate();

    /**
     * Performs the action stored
     */
    abstract void performAction();

}