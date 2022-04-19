import 'package:api_fetchdata_from_internet/19_4_2022/practice2/infoclass192.dart';
import 'package:flutter/material.dart';

class HomeScreen192 extends StatefulWidget {
  const HomeScreen192({Key? key}) : super(key: key);

  @override
  State<HomeScreen192> createState() => _HomeScreen192State();
}

class _HomeScreen192State extends State<HomeScreen192> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<UserInfo192>>(
          future: fetchData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<UserInfo192>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Image.network(
                            '''${snapshot.data!.elementAt(index).image}'''),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error : ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
