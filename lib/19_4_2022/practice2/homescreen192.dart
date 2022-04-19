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
                  int starRate =
                      snapshot.data!.elementAt(index).rating.rate.toInt();
                  return Container(
                    margin: const EdgeInsets.only(
                        left: 5, right: 5, top: 8, bottom: 8),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 50,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.grey.shade200,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 10, top: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(1.8, 4.5),
                                      color: Colors.grey.shade500,
                                      blurRadius: 6,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    snapshot.data!.elementAt(index).image,
                                    width: 130,
                                    height: 150,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: const Color(0xff86a6de),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Center(
                                  child: Text(
                                    "In Stock : " +
                                        snapshot.data!
                                            .elementAt(index)
                                            .rating
                                            .count
                                            .toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 10, top: 10),
                                padding:
                                    const EdgeInsets.only(left: 2, right: 2),
                                height: 25,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: const Color(0xffa7acec),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    stars(starRate) +
                                        "   ${snapshot.data!.elementAt(index).rating.rate}",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 10, top: 10),
                                padding:
                                    const EdgeInsets.only(left: 2, right: 2),
                                height: 25,
                                width: 130,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xfff29383).withOpacity(0.55),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "Price : " +
                                        snapshot.data!
                                            .elementAt(index)
                                            .price
                                            .toString() +
                                        " \$",
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 10, right: 5, bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xffd6e8ee).withOpacity(0.7),
                            ),
                            width: MediaQuery.of(context).size.width - 178,
                            child: Container(
                              width: MediaQuery.of(context).size.width - 180,
                              padding: const EdgeInsets.only(
                                  top: 10, left: 5, right: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.elementAt(index).title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17),
                                        maxLines: 4,
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        'Description',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 19,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        snapshot.data!
                                            .elementAt(index)
                                            .description,
                                        maxLines: 5,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 18, left: 8),
                                      width: 110,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          "assets/images/buygreen.png",
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
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

  String stars(int n) {
    String text = '';
    for (int i = 1; i <= n; i++) {
      text = text + "⭐";
    }
    return text;
  }
}
