import 'dart:convert';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_api/bitcoin_Model.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map? data;
  Future<BitcoinModel> fetchdata() async {
    BitcoinModel bm;
    String url = 'https://api.coindesk.com/v1/bpi/currentprice.json';
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonresponse = json.decode(response.body);
    bm = BitcoinModel.fromJson(jsonresponse);
    return bm;
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.2),
      body: SafeArea(
        child: FutureBuilder<BitcoinModel>(
          future: fetchdata(),
          builder: (context, AsyncSnapshot<BitcoinModel> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Vikalp",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                myCards("${snapshot.data!.time!.updated}"),
                myCards("${snapshot.data!.disclaimer}"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        "EURU",
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                          child: myCards("${snapshot.data!.bpi!.eur!.rate}"))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        "GDP",
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                          child: myCards("${snapshot.data!.bpi!.gbp!.rate}"))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        "USD",
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                          child: myCards("${snapshot.data!.bpi!.usd!.rate}"))
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Container myCards(String text) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          color: Colors.amber,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('$text'),
          ),
        ),
      ),
    );
  }
}
