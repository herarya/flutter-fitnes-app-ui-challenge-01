import 'package:flutter/material.dart';
import 'package:flutter_fitnes_app/home.dart';

class CompletedGoal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: 16.0,
            ),
            Text("COMPLETED GOALS",
                style: TextStyle(
                    color: Color(0xFF30314A), fontWeight: FontWeight.bold)),
            Spacer(),
            Text(
              "VIEW ALL",
              style: TextStyle(
                  color: appTheme.primaryColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      Container(
        child: ListView(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            children: completedGoals),
      )
    ]));
  }
}

List<CompletedGoalCard> completedGoals = [
  CompletedGoalCard(
      "assets/images/lose_5kgs.png", "Lose 5kgs in 1 Week", "1250", "2,500"),
  CompletedGoalCard(
      "assets/images/marathon.png", "Run 100 Mile", "1250", "2,500")
];

class CompletedGoalCard extends StatelessWidget {
  final String imagePath, challengeName, memberCount, prize;
  CompletedGoalCard(
      this.imagePath, this.challengeName, this.memberCount, this.prize);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Color(0xFF0099FF)
                        ),
                        child: Icon(Icons.near_me,color: Colors.white),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0,left: 10),
                              child: Text(
                                  '10Km Run',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ),
                            Wrap(
                              children: <Widget>[
                                CompletedGoalDetailChip(Icons.timer,"210ms"),
                                CompletedGoalDetailChip(Icons.whatshot,"490Kcl"),
                                CompletedGoalDetailChip(Icons.date_range,"2012"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          )),
    );
  }
}

class CompletedGoalDetailChip extends StatelessWidget {
  final IconData iconData;
  final String label;

  CompletedGoalDetailChip(this.iconData, this.label);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.only(top: 2.0),
      label: Text(label),
      labelPadding: EdgeInsets.only(left: 2.0),
      labelStyle: TextStyle(
        color: Colors.grey,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.white,
      avatar: Icon(
        iconData,
        size: 14.0,
      ),
    );
  }
}
