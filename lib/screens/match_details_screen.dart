import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MatchDetailsScreen extends StatefulWidget {
  final int id;
  final String second_team_name;
  final String first_team_name;

  const MatchDetailsScreen({super.key, required this.first_team_name, required this.second_team_name, required this.id});

  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  bool _inProgressStatus = false;
  int? firstTeamGoal;
  int? secondTeamGoal;
  String? totalTime;
  String? runningTime;
  bool _isSuccessQuery = false;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> getMatchInfo() async {
    _inProgressStatus = true;
    setState(() {});

    var result = firebaseFirestore.collection('playing_match');
    var querySnapshot = await result.where("id", isEqualTo: widget.id).get();

    if (querySnapshot.docs.isNotEmpty) {
      _isSuccessQuery = true;
      var firstDocument = querySnapshot.docs[0];
      firstTeamGoal = int.tryParse(firstDocument.get("first_team_goal").toString());
      secondTeamGoal = int.tryParse(firstDocument.get("second_team_goal").toString());
      runningTime = firstDocument.get("running_time");
      totalTime = firstDocument.get("total_time");
    }

    _inProgressStatus = false;
    setState(() {});
  }


  @override
  void initState() {
    super.initState();
    getMatchInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.first_team_name} VS ${widget.second_team_name}'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(onPressed: () async {
            getMatchInfo();
          }, icon: const Icon(Icons.refresh))
        ],
      ),
      body:  SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            getMatchInfo();
          },
          child: Visibility(
            visible: !_inProgressStatus,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: Card(
              elevation: 8,
              margin: const EdgeInsets.all(8),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                side: BorderSide(
                  color: Colors.black12,
                  width: 1.0, // Border width
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: _isSuccessQuery? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    Text('${widget.first_team_name} VS ${widget.second_team_name}', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black54),),
                    const SizedBox(height: 10,),
                    Text('$firstTeamGoal : $secondTeamGoal', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500,),),
                    const SizedBox(height: 10,),
                    Text('Time: $totalTime', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500,),),
                    const SizedBox(height: 10,),
                    Text('Running Time: $runningTime', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500,),),
                  ],
                ) : const Center(
                  child: Text("No Data Found! Please reload."),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
