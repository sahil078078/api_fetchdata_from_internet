import 'package:api_fetchdata_from_internet/16_4_2022/practice2/infoClass162.dart';
import 'package:flutter/material.dart';

class HomeScreen162 extends StatelessWidget {
  const HomeScreen162({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<UserInfo162>(
          future: fetchData(),
          builder: (BuildContext context, snapshot) {
            return Text('');
          },
        ),
      ),
    );
  }
}
