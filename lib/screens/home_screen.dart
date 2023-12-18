import 'package:flutter/material.dart';
import '../controllers/match_list_controller.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MatchListController _matchListController = Get.find<
      MatchListController>();

  @override
  void initState() {
    super.initState();
    _matchListController.getMatchesInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Match Lists"),
      ),
      body: SafeArea(
        child: GetBuilder<MatchListController>(builder: (controller) {
          return Container(
            child: ListView.builder(
              itemCount: controller.matchList.length,
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
                    title: Text("${controller.matchList[index]
                        .firstTeamName} VS ${controller.matchList[index].secondTeamName}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),),
                    trailing: const Icon(Icons.arrow_right_alt),
                    onTap: () {
                      print("tab");
                    },
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

