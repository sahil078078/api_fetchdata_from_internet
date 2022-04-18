import 'package:api_fetchdata_from_internet/18_4_2022/practice2/infoclass182.dart';
import 'package:flutter/material.dart';

class HomeScreen182 extends StatefulWidget {
  const HomeScreen182({Key? key}) : super(key: key);

  @override
  State<HomeScreen182> createState() => _HomeScreen182State();
}

class _HomeScreen182State extends State<HomeScreen182> {
  @override
  Future<UserInfo182>? _getData;

  void initState() {
    super.initState();
    _getData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<UserInfo182>(
        future: _getData,
        builder: (BuildContext context, AsyncSnapshot<UserInfo182> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      children: [
                        Text(snapshot.data!.msg),
                        Text(snapshot.data!.data.elementAt(index).email),
                        Text(
                            snapshot.data!.data.elementAt(index).mobile_number),
                      ],
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("Error :  ${snapshot.error}");
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
