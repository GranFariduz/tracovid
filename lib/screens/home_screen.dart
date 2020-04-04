import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';

import 'package:tracovid/constants.dart';

// components
import 'package:tracovid/components/covid_card.dart';

class HomeScreen extends StatefulWidget {
  final List covidData;
  HomeScreen({@required this.covidData});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cases = 0;
  int recovered = 0;
  int deaths = 0;
  int initialCountryIndex = 114; // india index
  List covidData;

  @override
  void initState() {
    super.initState();
    getCovidData();
  }

  void getCovidData() async {
    covidData = widget.covidData;
    setState(() {
      cases = covidData[initialCountryIndex]["cases"];
      recovered = covidData[initialCountryIndex]["recovered"];
      deaths = covidData[initialCountryIndex]["deaths"];
    });
  }

  void updateUI(int newIndex) {
    setState(() {
      cases = covidData[newIndex]["cases"];
      recovered = covidData[newIndex]["recovered"];
      deaths = covidData[newIndex]["deaths"];
    });
  }

  List<Widget> getCountries() {
    List<Widget> countries = [];
    try {
      for (Map data in covidData) {
        countries.add(
          Text(
            data["country"].toUpperCase(),
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 16,
              fontFamily: "Poppins",
            ),
          ),
        );
      }
    } catch (err) {
      countries.add(Text("India"));
    }
    return countries;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15, bottom: 30, top: 50),
              child: Image(
                height: 40,
                width: 10,
                alignment: Alignment.topLeft,
                image: AssetImage("images/TracovidLogo-trans-alt.png"),
              ),
            ),
            Expanded(
              flex: 3,
              child: CovidCard(
                title: "CASES",
                number: cases.toString(),
                background: AssetImage("images/cases-bg.jpg"),
                gradientStart: kCasesColor1,
                gradientEnd: kCasesColor2,
                shadowColor: kCasesShadow,
              ),
            ),
            Expanded(
              flex: 3,
              child: CovidCard(
                title: "RECOVERED",
                number: recovered.toString(),
                background: AssetImage("images/recovered-bg.png"),
                gradientStart: kRecoveredColor1,
                gradientEnd: kRecoveredColor2,
                shadowColor: kRecoveredShadow,
              ),
            ),
            Expanded(
              flex: 3,
              child: CovidCard(
                title: "DEATHS",
                number: deaths.toString(),
                background: AssetImage("images/deaths-bg.jpg"),
                gradientStart: kDeathsColor1,
                gradientEnd: kDeathsColor2,
                shadowColor: kDeathsShadow,
              ),
            ),
            Expanded(
              // WARNING: changed the source file of picker.dart to remove dividers
              child: CupertinoPicker(
                looping: true,
                backgroundColor: Colors.white,
                itemExtent: 28,
                children: getCountries(),
                scrollController: FixedExtentScrollController(
                    initialItem: initialCountryIndex),
                onSelectedItemChanged: (index) {
                  updateUI(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
