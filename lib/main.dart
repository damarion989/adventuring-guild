import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Adventurer {
  final String name;
  final String role;
  final int goldCost;

  Adventurer({required this.name, required this.role, required this.goldCost});
}

class PartyModel extends ChangeNotifier {
  final List<Adventurer> _party = [];

  List<Adventurer> get party => List.unmodifiable(_party);
  int get partyCount => _party.length;

  int get totalCost {
    int total = 0;
    for (Adventurer adventurer in _party) {
      total += adventurer.goldCost;
    }
    return total;
  }

  void addAdventurer(Adventurer adventurer) {
    _party.add(adventurer);
    notifyListeners();
  }

  void removeAdventurer(Adventurer adventurer) {
    _party.remove(adventurer);
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PartyModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Adventuring Guild')),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: GuildHallRoster()),
              const Divider(),
              const Expanded(child: QuestPartySummary()),
            ],
          ),
        ),
      ),
    );
  }
}

class GuildHallRoster extends StatelessWidget {
  GuildHallRoster({super.key});

  final List<Adventurer> availableAdventurers = [
    Adventurer(name: 'Aria Ironheart', role: 'Knight', goldCost: 150),
    Adventurer(name: 'Eldrin Starweaver', role: 'Mage', goldCost: 200),
    Adventurer(name: 'Lyra Swiftfoot', role: 'Rogue', goldCost: 120),
    Adventurer(name: 'Brakka Oakshield', role: 'Paladin', goldCost: 180),
    Adventurer(name: 'Zephyr Whisperwind', role: 'Ranger', goldCost: 140),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(12),
          child: Text('Guild Hall Roster', style: TextStyle(fontSize: 22)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: availableAdventurers.length,
            itemBuilder: (context, index) {
              final adventurer = availableAdventurers[index];
              return ListTile(
                title: Text(adventurer.name),
                subtitle: Text('${adventurer.role} - ${adventurer.goldCost} Gold'),
                trailing: ElevatedButton(
                  onPressed: () {
                    context.read<PartyModel>().addAdventurer(adventurer);
                  },
                  child: const Text('Recruit'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class QuestPartySummary extends StatelessWidget {
  const QuestPartySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PartyModel>(
      builder: (context, partyModel, child) {
        final members = partyModel.party;
        return Column(
          children: [
            const Text('Quest Party Summary', style: TextStyle(fontSize: 22)),
            Text('Party Count: ${partyModel.partyCount}'),
            Text('Total Gold Cost: ${partyModel.totalCost} Gold'),
            Expanded(
              child: members.isEmpty
                  ? const Center(child: Text('No adventurers recruited yet.'))
                  : ListView.builder(
                      itemCount: members.length,
                      itemBuilder: (context, index) {
                        final adventurer = members[index];
                        return ListTile(
                          title: Text(adventurer.name),
                          subtitle: Text('${adventurer.goldCost} Gold'),
                          trailing: TextButton(
                            onPressed: () {
                              context.read<PartyModel>().removeAdventurer(adventurer);
                            },
                            child: const Text('Dismiss'),
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
