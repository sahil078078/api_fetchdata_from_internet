import 'package:api_fetchdata_from_internet/16_4_2022/practice1/infoClass161.dart';
import 'package:flutter/material.dart';

class HomeScreen161 extends StatelessWidget {
  const HomeScreen161({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('API fetch'),
      ),
      body: FutureBuilder<List>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var datainput = snapshot.data!.elementAt(index);
                  return Container(
                    margin: const EdgeInsets.only(
                        left: 5, right: 5, top: 10, bottom: 10),
                    padding: const EdgeInsets.only(
                        left: 10, top: 15, bottom: 15, right: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage(datainput['image']),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              datainput['worktech'],
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name : ${datainput['name']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              'User Exp : ${datainput['exp']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              'Contact : ${datainput['contact']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                });
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
/*
SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            3,
            (index) => Card(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/men/72.jpg'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )
 */
