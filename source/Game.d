module stratd.Game;

import stratd;

/**
 * The main game class which contains every component in the game
 */
abstract class Game : Activity {

    World world; ///The world used by the game
    Map map; ///The map component on the screen
    Query query; ///The query currently active
    
    /**
     * Constructs a new game in the given display and using the given world
     */
    this(Display container, World world) {
        super(container);
        this.world = world;
    }

    /**
     * Sets the query to be the given query
     */
    void setQuery(Query query) {
        this.query = query;
    }

    /**
     * Handles events,
     * if the window is resized update components to compensate
     * Should be overridden
     * Tries to fulfill currently active query
     */
    override void handleEvent(SDL_Event event) {
        if(event.type == SDL_WINDOWEVENT) {
            if(event.window.event == SDL_WINDOWEVENT_RESIZED) {
                this.updateComponents();
            }
        }
        if(this.query !is null) {
            if(this.cancelQuery(event)) {
                this.query.cancel();
            } else {
                this.query.ask(event);
            }
        }
    }

    /**
     * Updates all of the components on the screen
     */
    void updateComponents() {
        foreach(component; this.components) {
            if(cast(StratdComponent)component) {
                (cast(StratdComponent)component).updateTexture();
            }
        }
    }

    /**
     * Defines what determines whether a query is cancelled
     * Must be defined by game overrider
     * Returns whether or not the query should be cancelled
     */
    abstract bool cancelQuery(SDL_Event event);

    /**
     * Runs when the game starts
     */
    abstract void startGame();

    /**
     * What happens when a turn ends
     */
    abstract void endTurn();

}