import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/match_model.dart';

class MatchListController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  bool _getMatchListScreenInProgress = false;
  final List<MatchData> _matchList = [];

  bool get getMatchListScreenInProgress => _getMatchListScreenInProgress;
  List<MatchData> get matchList => _matchList;

  Future<bool> getMatchesInfo() async {
    _matchList.clear();
    _getMatchListScreenInProgress = true;
    update();

    QuerySnapshot result = await firebaseFirestore.collection('playing_match').get();
    for (QueryDocumentSnapshot element in result.docs) {
      MatchData matchData = MatchData(
        id: element.get('id'),
        secondTeamGoal: int.tryParse(element.get('second_team_goal').toString()) ?? 0,
        runningTime: element.get('running_time'),
        firstTeamGoal: int.tryParse(element.get('first_team_goal').toString()) ?? 0,
        totalTime: element.get('total_time'),
        firstTeamName: element.get('first_team_name'),
        secondTeamName: element.get('second_team_name'),
      );

      _matchList.add(matchData);
    }

    _getMatchListScreenInProgress = false;
    update();
    return true;

  }
}