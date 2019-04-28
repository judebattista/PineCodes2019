import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  PageHome({Key key}) : super(key:key);
  @override
  //PageHomeState createState() => PageHomeState();
  PageHomeState createState() {
    return new PageHomeState();
  }
}



class PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    const double coinSize = 30;
    return Scaffold(
      appBar : AppBar(
        title: Text('Demo Character\'s stats'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'College: The RPG',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )
                )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset(
                    'Assets/Coin.gif',
                    width: coinSize,
                    height: coinSize,
                    fit: BoxFit.contain,
                  ),

                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
              ),
              Column(
                  children: <Widget>[
                    Text('0 gp'
                    ),
                  ]
              ),
              Column(
                children: <Widget>[
                  Image.asset(
                    'Assets/demo_character.gif',
                    width: 300,
                    height: 500,
                    fit: BoxFit.contain,
                  ),
                  Text('Demo Character'),
                ]
              ),
            ],
          ),
        ], //ListView children
      ),
    );
  }
}
