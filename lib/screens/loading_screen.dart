import 'package:flutter/material.dart';
import 'package:tracovid/constants.dart';

// screens
import 'package:tracovid/screens/home_screen.dart';

// services
import 'package:tracovid/services/network.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List covidData;

  @override
  void initState() {
    super.initState();
    getCovidData();
  }

  void getCovidData() async {
    Network network = Network();
    covidData = await network.getData();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          covidData: covidData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/loadingScreen-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(top: 120),
                padding: EdgeInsets.all(80),
                child: Center(
                  child: Image.asset("images/TracovidLogo-trans.png"),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 120),
                child: Center(
                  child: SizedBox(
                    height: 3,
                    child: LinearProgressIndicator(
                      backgroundColor: primaryDarkColor,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
