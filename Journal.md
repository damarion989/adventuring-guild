
## Phase 1: Keeping track of the party

Adventurer stores a hero's name, role, and gold cost. PartyModel keeps the list of hired heroes. It also counts them and adds up their gold costs using a loop.

The list is private so other parts of the app cannot change it directly. They can look at the list, but they must use the add and remove methods to change it.

notifyListeners is like telling the summary, "The party changed. Check the new information." Without it, a hero could be added to the data while the screen still shows the old count and cost until something else causes a rebuild.

My question or something I need help with: [Write here.]

## Phase 2: Sharing one party

ChangeNotifierProvider creates one PartyModel above MyApp. Both the Guild Hall and Party Summary are below it, so they can use the same party information.

If the provider only wrapped one hero's list item, the summary outside that item could not get the model from that provider. It needs to be above both views.

My question or something I need help with: [Write here.]

## Phase 3: Recruiting heroes

The Guild Hall shows each hero's name, role, cost, and a Recruit button. Pressing Recruit uses context.read to get PartyModel and call addAdventurer.

read gets the model without listening for future changes. watch listens for changes and is used while building a widget that should update. The button uses read because it only needs to tell the model to add someone. It does not need to start listening inside the button press.

My question or something I need help with: [Write here.]

## Phase 4: Updating the summary

The steps are: press Recruit, call addAdventurer, add the hero to the list, and call notifyListeners. Consumer listens to PartyModel and rebuilds the summary with the new count, cost, and names.

Dismiss uses removeAdventurer. That method removes one matching hero and calls notifyListeners so the summary updates again.

My question or something I need help with: [Write here.]

## Phase 5: Review and testing

The AI review suggested keeping one shared model, putting the provider above both views, using read for buttons, and Consumer for the summary. The code follows those suggestions without adding extra libraries beyond provider.

The code allows recruiting the same hero more than once. Dismiss removes one entry at a time. An empty party should show a count and cost of zero and a message saying no heroes have been recruited.

The app has not been run in Flutter in the preparation environment. These are checks to perform, not claimed test results:

- Start with an empty party: count 0 and cost 0.
- Recruit Aria: count 1 and cost 150.
- Recruit Eldrin: count 2 and cost 350.
- Dismiss Aria: count 1 and cost 200.
- Dismiss Eldrin: count 0 and cost 0.
- Recruit Aria twice: count 2 and cost 300. Dismiss one: count 1 and cost 150.
- Check that changes appear without refreshing the screen.

My actual results after running the app: [Write here.]

Any bugs, questions, or things I still need help with: [Write here.]
