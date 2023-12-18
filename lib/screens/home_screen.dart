
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/match_model.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MatchData> matchList = [];
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> getMatchesInfo() async {
    QuerySnapshot result = await firebaseFirestore.collection('playing_match').get();
    for (QueryDocumentSnapshot element in result.docs) {
      MatchData matchData = MatchData(
        secondTeamGoal: int.tryParse(element.get('second_team_goal').toString()) ?? 0,
        runningTime: element.get('running_time'),
        firstTeamGoal: int.tryParse(element.get('first_team_goal').toString()) ?? 0,
        totalTime: element.get('total_time'),
        firstTeamName: element.get('first_team_name'),
        secondTeamName: element.get('second_team_name'),
      );

      matchList.add(matchData);
      if(mounted) {
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getMatchesInfo();
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
          itemCount: matchList.length,
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
                title: Text("${matchList[index].firstTeamName} VS ${matchList[index].secondTeamName}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
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

