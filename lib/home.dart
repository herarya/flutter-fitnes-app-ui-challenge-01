import 'package:flutter/material.dart';
import 'package:flutter_fitnes_app/BannerBgCustomPath.dart';
import 'package:flutter_fitnes_app/CompletedGoal.dart';
import 'package:flutter_fitnes_app/CustomButtonBar.dart';
import 'package:flutter_fitnes_app/ListChallenge.dart';
import 'package:flutter_fitnes_app/RecentChallenge.dart';

ThemeData appTheme = ThemeData(
    primaryColor: Color(0xFF3467E3), primaryColorDark: Color(0xFF295DD9));

const TextStyle goalCountStyle =
    TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.black);
const TextStyle goalUnitStyle = TextStyle(color: Colors.grey);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Dashbord",
          style: TextStyle(fontSize: 16.0),
        ),
        backgroundColor: appTheme.primaryColor,
        centerTitle: false,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Column(
            children: <Widget>[
              BannerSection(),
              RecentChallnge(),
              CompletedGoal()],
        ),
          ),
      ),
      bottomNavigationBar: CustomButtonBar(),
    );
  }
}

class BannerSection extends StatefulWidget {
  @override
  _BannerSectionState createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: BannerBgCustomPath(),
            child: Container(
              color: appTheme.primaryColor,
              height: 300,
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                elevation: 10.0,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 22.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                          SizedBox(
                        height: 20,
                      ),
                      Text(
                        "TODAY'S GOAL",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GoalCount("KCAL", "1,200", "Calories"),
                          Spacer(),
                          GoalCount("M", "90", "Cardio")
                        ],
                      ),
                      SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          onPressed: () {
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ListChallenge()),
                                );
                          },
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                          color: Color(0xFFF5F5F7),
                          child: Text("START CHALLANGE",style: TextStyle(color: Color(0xFF30314A)),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class GoalCount extends StatelessWidget {
  final String unit, total, unitName;
  GoalCount(this.unit, this.total, this.unitName);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              total,
              style: goalCountStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(unit, style: goalUnitStyle),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(unitName, style: goalUnitStyle),
            ),
          ],
        )
      ],
    );
  }
}


