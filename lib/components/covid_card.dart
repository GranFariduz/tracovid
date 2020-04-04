import 'package:flutter/material.dart';

class CovidCard extends StatelessWidget {
  final String title;
  final String number;
  final Color gradientStart;
  final Color gradientEnd;
  final AssetImage background;
  final Color shadowColor;

  CovidCard(
      {this.title,
      this.number,
      this.gradientStart,
      this.gradientEnd,
      this.background,
      this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: shadowColor,
            spreadRadius: 1,
            blurRadius: 30,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ShaderMask(
                blendMode: BlendMode.srcOver,
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [gradientStart, gradientEnd],
                  ).createShader(
                    Rect.fromLTRB(0, -140, rect.width, rect.height - 20),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: background,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: double.infinity,
              padding: EdgeInsets.all(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                      fontFamily: "Poppins",
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    number,
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
