class MatchData {
  final String firstTeamName;
  final String secondTeamName;
  final int secondTeamGoal;
  final int firstTeamGoal;
  final String runningTime;
  final String totalTime;

  MatchData({
    required this.secondTeamGoal,
    required this.runningTime,
    required this.firstTeamGoal,
    required this.totalTime,
    required this.firstTeamName,
    required this.secondTeamName,
  });
}