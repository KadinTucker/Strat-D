module stratd.Game;

import stratd;

/**
 * The main game class which contains every component in the game
 */
abstract class Game : Activity {

    private World _world; ///The world used by the game
    private Map _map; ///The map component on the screen
    
    /**
     * Constructs a new game in the given display and using the given world
     */
    this(Display container, World world) {
        super(container);
        this._world = world;
    }

    /**
     * Handles events,
     * if the window is resized update components to compensate
     * Should be overridden
     */
    override void handleEvent(SDL_Event event) {
        if(event.type == SDL_WINDOWEVENT) {
            if(event.window.event == SDL_WINDOWEVENT_RESIZED) {
                this.updateComponents();
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
     * Runs when the game starts
     */
    abstract void startGame();

    /**
     * What happens when a turn ends
     */
    abstract void endTurn();

}