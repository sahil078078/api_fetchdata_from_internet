import 'package:api_fetchdata_from_internet/16_4_2022/practice2/infoClass162.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen162 extends StatelessWidget {
  const HomeScreen162({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder<List<UserInfo162>>(
          future: fetchData(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 5, right: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 8, bottom: 10, left: 10, right: 10),
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25),
                                    ),
                                    child: Image.network(
                                        snapshot.data!.elementAt(index).image,
                                        height: 120,
                                        width: 110,
                                        fit: BoxFit.cover),
                                  ),
                                  Text("Name : " +
                                      snapshot.data!.elementAt(index).name),
                                  Text("Contact No : " +
                                      snapshot.data!
                                          .elementAt(index)
                                          .contact
                                          .toString()),
                                  Text("Working On : " +
                                      snapshot.data!.elementAt(index).worktech),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 8, bottom: 10, left: 0, right: 5),
                          padding: const EdgeInsets.only(right: 30),
                          width: MediaQuery.of(context).size.width - 185,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Employee ID : " +
                                  snapshot.data!
                                      .elementAt(index)
                                      .userId
                                      .toString()),
                              Text("Experience : " +
                                  snapshot.data!
                                      .elementAt(index)
                                      .exp
                                      .toString() +
                                  " Year"),
                              const Text("Languages : "),
                              Text(
                                snapshot.data!.elementAt(index).lang,
                              ),
                              Text('FramWork : ' +
                                  snapshot.data!.elementAt(index).framwork),
                              Text('Working Time : ' +
                                  snapshot.data!.elementAt(index).wotktime),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("Error : " + snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
