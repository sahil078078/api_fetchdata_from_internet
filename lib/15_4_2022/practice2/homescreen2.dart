import 'package:api_fetchdata_from_internet/15_4_2022/practice2/infoClass.dart';
import 'package:flutter/material.dart';

class HomeScreen152 extends StatefulWidget {
  const HomeScreen152({Key? key}) : super(key: key);

  @override
  State<HomeScreen152> createState() => _HomeScreen152State();
}

class _HomeScreen152State extends State<HomeScreen152> {
  late Future<InfoAPI> getData;

  @override
  void initState() {
    super.initState();
    // getData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fetch From API')),
      body: SingleChildScrollView(
        child: FutureBuilder<List<InfoAPI>>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        snapshot.data!.length,
                        (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(snapshot.data!.elementAt(1)),
                                Text(
                                    "UserID : ${snapshot.data!.elementAt(index).UserId}"),
                                Text(
                                    "ID : ${snapshot.data!.elementAt(index).id}"),
                                Text(
                                    "Title : ${snapshot.data!.elementAt(index).title}"),
                                Text(
                                    "Body : ${snapshot.data!.elementAt(index).body}"),
                                const SizedBox(height: 20),
                              ],
                            )));
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
/*
  int UserId;
  int id;
  String title;
  String body;
*/

/*

FutureBuilder<InfoAPI>(
          future: getData.,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("UserID : ${snapshot.data!.UserId}"),
                  Text("ID : ${snapshot.data!.id}"),
                  Text("Title : ${snapshot.data!.title}"),
                  Text("Body : ${snapshot.data!.body}",
                      textAlign: TextAlign.justify),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Center(child: CircularProgressIndicator());
          })
 */
