
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_firebase/models/match_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final firebaseApp = Firebase.app();
    final database = FirebaseDatabase.instanceFor(app: firebaseApp, databaseURL: 'https://flutter-firebase-32914-default-rtdb.firebaseio.com/');
    final snapshot = await database.ref('match').get();
    if (snapshot.exists) {
      //print(snapshot.value);

      // Map<String, dynamic> jsonData = {
      //   "matches": [
      //     {
      //       "first_team": {"team_name": "Argentina", "goals": 5},
      //       "running_time": "83:22",
      //       "second_team": {"team_name": "Bangladesh", "goals": 7},
      //       "total_time": "90:00"
      //     },
      //     {
      //       "first_team": {"team_name": "Brazil", "goals": 3},
      //       "running_time": "43:32",
      //       "second_team": {"team_name": "Africa", "goals": 0},
      //       "total_time": "90:00"
      //     }
      //   ]
      // };
      //
      // Match matchData = Match.fromJson(jsonData);

      // for (var match in matchData.matches!) {
      //   print("Match:");
      //   print("  First Team: ${match.firstTeam!.teamName} (${match.firstTeam!.goals} goals)");
      //   print("  Running Time: ${match.runningTime}");
      //   print("  Second Team: ${match.secondTeam!.teamName} (${match.secondTeam!.goals} goals)");
      //   print("  Total Time: ${match.totalTime}");
      //   print("");
      // }

    } else {
      print('No data available.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title:const Text("Match Lists"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 8, left: 5, right: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(
                  color: Colors.black12,
                  width: 1.0,
                ),
              ),
              child: ListTile(
                title: Text('Item 1', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                trailing: const Icon(Icons.arrow_right_alt),
                onTap: () {
                  print("tab");
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
