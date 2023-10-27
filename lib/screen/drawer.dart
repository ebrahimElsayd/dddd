import 'package:flutter/material.dart';

class DrawerTab extends StatelessWidget {
  Function onClick;

  DrawerTab(this.onClick, {super.key});

  static int CAT_ID = 1;
  static int SETT_ID = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * .6,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.green,
              child: Center(child: Text("News App")),
            ),
            InkWell(
              onTap: () {
                onClick(CAT_ID);
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Categories"),
              ),
            ),
            InkWell(
              onTap: () {
                onClick(SETT_ID);
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Settings"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
