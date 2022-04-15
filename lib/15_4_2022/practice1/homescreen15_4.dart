import 'package:api_fetchdata_from_internet/15_4_2022/practice1/album.dart';
import 'package:flutter/material.dart';

class HomeScreen15 extends StatefulWidget {
  HomeScreen15({Key? key}) : super(key: key);

  @override
  State<HomeScreen15> createState() => _HomeScreen15State();
}

class _HomeScreen15State extends State<HomeScreen15> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("User Id : ${snapshot.data!.userId}"),
                    Text("ID : ${snapshot.data!.id}"),
                    Text("Title : ${snapshot.data!.title}")
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
