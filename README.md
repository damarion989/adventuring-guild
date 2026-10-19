# Adventuring Guild — simple Flutter assignment

Included: lib/main.dart, pubspec.yaml, and Journal.md.

## Run on a computer with Flutter installed
1. Extract this ZIP.
2. Open the adventuring_guild folder in VS Code.
3. Open Terminal > New Terminal in that folder.
4. Generate the standard web platform files:

   flutter create --platforms=web .

5. Install dependencies:

   flutter pub get

6. Run in Chrome:

   flutter run -d chrome

If using an existing Flutter project instead, replace its lib/main.dart with the included file and run `flutter pub add provider` from that project's terminal. Then run the project normally.

## Manual checks
- Empty party: count 0, cost 0, and an empty-party message.
- Recruit Aria: count 1, cost 150.
- Recruit Eldrin: count 2, cost 350.
- Dismiss Aria: count 1, cost 200.
- Dismiss Eldrin: count 0, cost 0.
- Recruit Aria twice: count 2, cost 300.
- Dismiss one Aria: count 1, cost 150.
- Dismiss the final Aria: count 0, cost 0.
- Recruit all five different heroes: count 5, cost 790.
- Confirm updates happen immediately without refreshing.

Duplicates are allowed; each dismissal removes one entry. State resets when the app restarts because persistent storage is outside this assignment.

## Submission
Review the code and journal so you can explain them. Complete manual testing and update Phase 5 with your actual results. Follow your instructor's submission format for the source and journal.

## Validation status
The source and package contents were reviewed during preparation. Flutter and Dart are unavailable in the preparation environment, so compilation, analysis, and UI execution have not been performed.
