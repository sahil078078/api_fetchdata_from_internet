import 'package:api_fetchdata_from_internet/18_4_2022/practice1/homescreen_181.dart';
import 'package:flutter/material.dart';

class HomeScreen181 extends StatefulWidget {
  const HomeScreen181({Key? key}) : super(key: key);

  @override
  State<HomeScreen181> createState() => _HomeScreen181State();
}

class _HomeScreen181State extends State<HomeScreen181> {
  Future<List<UserInfo181>>? _getData;

  @override
  void initState() {
    super.initState();
    _getData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("API FetchData"),
      ),
      body: FutureBuilder<List<UserInfo181>>(
          future: _getData,
          builder: (BuildContext context,
              AsyncSnapshot<List<UserInfo181>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Text(snapshot.data!.elementAt(index).name),
                        Text(snapshot.data!.elementAt(index).address.city),
                        Text(snapshot.data!.elementAt(index).address.geo.lng),
                        Text(snapshot.data!
                            .elementAt(index)
                            .company
                            .catchPhrase),
                        Text(snapshot.data!.elementAt(index).company.name),
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
