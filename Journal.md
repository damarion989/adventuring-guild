# Adventuring Guild Journal

## Phase 1
The code defines an Adventurer class with a name, role, and gold cost. PartyModel keeps the hired adventurers in a private list and calculates the count and total gold cost. The public getter returns an unmodifiable list so other code cannot change it directly. notifyListeners tells listening widgets that the model changed. Without that call, adding a hero would change the data, but the summary could still show the old values until another rebuild.

## Phase 2
ChangeNotifierProvider is above MyApp so both the Guild Hall and Party Summary can access the same PartyModel. If it only wrapped an individual list item, widgets outside that item's subtree could not access it. Placing it above both views lets them share the party.

## Phase 3
context.read gets the model without subscribing the widget to updates. context.watch listens for changes when used during building. The Recruit button uses read because its job is to perform an action. The summary is responsible for listening and updating its display.

## Phase 4
When Recruit is pressed, the button calls addAdventurer on the shared model. That method adds the hero to the private list and calls notifyListeners. The Consumer in QuestPartySummary receives the notification and rebuilds its widgets with the current count, total cost, and roster. Dismiss follows the same process using removeAdventurer.

## Phase 5: Review and testing status
The AI review recommended a simple shared ChangeNotifier model, a provider above both views, read for actions, and Consumer for display updates. These choices are included in the code. Duplicates are allowed because the assignment does not require unique heroes. Removing a duplicate removes one entry at a time. The empty-party message handles the case where no heroes are hired.

The app has not been executed in Flutter in the preparation environment because Flutter is not installed there. Manual testing is still required. After running the checks in README.md, add the actual results and any bugs found here before submitting. No manual test results are claimed in this journal.
