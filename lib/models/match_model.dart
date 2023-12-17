class Match {
  List<Matches>? matches;

  Match({this.matches});

  Match.fromJson(Map<String, dynamic> json) {
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(new Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.matches != null) {
      data['matches'] = this.matches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Matches {
  FirstTeam? firstTeam;
  String? runningTime;
  FirstTeam? secondTeam;
  String? totalTime;

  Matches({this.firstTeam, this.runningTime, this.secondTeam, this.totalTime});

  Matches.fromJson(Map<String, dynamic> json) {
    firstTeam = json['first_team'] != null
        ? new FirstTeam.fromJson(json['first_team'])
        : null;
    runningTime = json['running_time'];
    secondTeam = json['second_team'] != null
        ? new FirstTeam.fromJson(json['second_team'])
        : null;
    totalTime = json['total_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.firstTeam != null) {
      data['first_team'] = this.firstTeam!.toJson();
    }
    data['running_time'] = this.runningTime;
    if (this.secondTeam != null) {
      data['second_team'] = this.secondTeam!.toJson();
    }
    data['total_time'] = this.totalTime;
    return data;
  }
}

class FirstTeam {
  int? goals;
  String? teamName;

  FirstTeam({this.goals, this.teamName});

  FirstTeam.fromJson(Map<String, dynamic> json) {
    goals = json['goals'];
    teamName = json['team_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goals'] = this.goals;
    data['team_name'] = this.teamName;
    return data;
  }
}
