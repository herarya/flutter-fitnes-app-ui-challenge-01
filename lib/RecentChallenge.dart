import 'package:flutter/material.dart';
import 'package:flutter_fitnes_app/ListChallenge.dart';
import 'package:flutter_fitnes_app/home.dart';

class RecentChallnge extends StatelessWidget {
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
            Text("RECENT CHALLENGES",
                style: TextStyle(
                    color: Color(0xFF30314A), fontWeight: FontWeight.bold)),
            Spacer(),
            InkWell(
              onTap: (){
                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ListChallenge()),
                                );
              },
              child: Text(
              "VIEW ALL",
              style: TextStyle(
                  color: appTheme.primaryColor, fontWeight: FontWeight.bold),
            ),
            )
            
          ],
        ),
      ),
      Container(
        height: 219.0,
        child: ListView(
            scrollDirection: Axis.horizontal, children: recentChallenges),
      )
    ]));
  }
}

List<RecentChallengeCard> recentChallenges = [
  RecentChallengeCard(
      "assets/images/lose_5kgs.png", "Lose 5kgs in 1 Week", "1250", "2,500"),
  RecentChallengeCard(
      "assets/images/marathon.png", "Run 100 Mile", "1250", "2,500")
];

class RecentChallengeCard extends StatelessWidget {
  final String imagePath, challengeName, memberCount, prize;
  RecentChallengeCard(
      this.imagePath, this.challengeName, this.memberCount, this.prize);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: MediaQuery.of(context).size.width - 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 219.0 / 2,
                      width: MediaQuery.of(context).size.width - 100,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                 
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(challengeName,style: TextStyle(color: appTheme.primaryColor,fontWeight: FontWeight.bold,fontSize: 16.0),),
              ),
              Wrap(
                    spacing: 8.0,
                    runSpacing: -8.0,
                    children: <Widget>[
                      ChallengeDetailChip(
                          Icons.group, '${memberCount}'),
                      ChallengeDetailChip(
                          Icons.card_giftcard, '${prize}'),
                    ],
                  )
            ],
          ),
        ),
      ),
    );
  }
}

class ChallengeDetailChip extends StatelessWidget {
  final IconData iconData;
  final String label;

  ChallengeDetailChip(this.iconData, this.label);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(color: Colors.black, fontSize: 14.0,fontWeight: FontWeight.bold),
      backgroundColor: Colors.white,
      avatar: Icon(
        iconData,
        size: 14.0,
      ),
    );
  }
}
