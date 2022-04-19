import 'package:flutter/material.dart';

import 'infoclass191.dart';

class HomeScreen191 extends StatefulWidget {
  const HomeScreen191({Key? key}) : super(key: key);

  @override
  State<HomeScreen191> createState() => _HomeScreen191State();
}

class _HomeScreen191State extends State<HomeScreen191> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<UserInfo191>(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot<UserInfo191> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(snapshot.data!.exif.make),
                  Image.network(snapshot.data!.user.profile_image.large),
                  Image.network(snapshot.data!.user.profile_image.medium),
                  Image.network(snapshot.data!.user.profile_image.small),
                  Text(snapshot.data!.location.position['latitude'].toString()),
                  Text(
                      snapshot.data!.location.position['longitude'].toString()),
                  Text(snapshot.data!.location.position.toString()),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("Error : ${snapshot.error}");
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                  backgroundColor: Colors.yellow,
                  strokeWidth: 5.5,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
