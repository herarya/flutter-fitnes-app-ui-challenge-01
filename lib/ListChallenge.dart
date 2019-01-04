import 'package:flutter/material.dart';
import 'package:flutter_fitnes_app/BannerBgCustomPath.dart';
import 'package:flutter_fitnes_app/home.dart';

class ListChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Challenge",
        ),
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: appTheme.primaryColor,
        leading: InkWell(
          child: Icon(Icons.chevron_left),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.filter_list),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
            ContentList()
        ],
      ),
    );
  }
}

List<ChellengeCard> chellenges = [
  ChellengeCard("assets/images/fitness_goals.png","Hardcore New Year","1250",'10,500',"100","Move into the new fresh beginnings!"),
  ChellengeCard("assets/images/marathon.png","Are you Marathon Ready","591",'6000',"40","Ultimate test of your body")
];

class ContentList extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: BannerBgCustomPath(),
            child: Container(
              color: appTheme.primaryColor,
              height: 200,
            ),
          ),
          Container(
            child: ListView(
                physics: ClampingScrollPhysics(),
            shrinkWrap: true,
              children: chellenges,
            ),
          )
        ],
      ),
    );
  }
}

class ChellengeCard extends StatelessWidget {
  final String imagePath, challengeName, memberCount, prize,minBet,descR;
  ChellengeCard(
      this.imagePath, this.challengeName, this.memberCount, this.prize,this.minBet,this.descR);
  @override
  Widget build(BuildContext context) {
     return Container(
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
                      height: 150,
                      width: MediaQuery.of(context).size.width,
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
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                child: Text(challengeName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(descR,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14.0),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ChallengeInfo(Icons.group,memberCount,"players"),
                    ChallengeInfo(Icons.card_giftcard,prize,"pot size"),
                    ChallengeInfo(Icons.group,minBet,"min bet")
                  ],
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}

class ChallengeInfo extends StatelessWidget {
  final IconData iconInfo;
  final String countInfo,labelName;
  ChallengeInfo(this.iconInfo,this.countInfo,this.labelName);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(iconInfo,color: appTheme.primaryColor,),
        SizedBox(width: 10,),
        Column(
          children: <Widget>[
            Text(countInfo,style: TextStyle(fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold),),
            Text(labelName,style: TextStyle(fontSize: 12.0,color: Colors.grey)),
          ],
        )
      ],
    );
  }
}