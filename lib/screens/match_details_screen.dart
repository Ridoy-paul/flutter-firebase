import 'package:flutter/material.dart';

class MatchDetailsScreen extends StatefulWidget {
  final String first_team_name;
  final String second_team_name;
  final int first_team_goal;
  final int second_team_goal;
  final String total_time;
  final String running_time;


  const MatchDetailsScreen({super.key, required this.first_team_name, required this.second_team_name, required this.first_team_goal, required this.second_team_goal, required this.total_time, required this.running_time});

  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.first_team_name} VS ${widget.second_team_name}'),
        backgroundColor: Colors.deepPurple,
      ),
      body:  SafeArea(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Text('${widget.first_team_name} VS ${widget.second_team_name}', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black54),),
                const SizedBox(height: 10,),
                Text('${widget.first_team_goal} : ${widget.second_team_goal}', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500,),),
                const SizedBox(height: 10,),
                Text('Time: ${widget.total_time}', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500,),),
                const SizedBox(height: 10,),
                Text('Running Time: ${widget.running_time}', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500,),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
