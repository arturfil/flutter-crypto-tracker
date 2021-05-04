import 'package:flutter/material.dart';
import 'package:youtube_crypto/screens/edit/edit_screen.dart';
import 'package:youtube_crypto/screens/home/transaction_future.dart';
import 'package:youtube_crypto/services/crypto_data.dart';
import 'package:youtube_crypto/widgets/large_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String displayPrice = "";
  double data;

  void getData() async {
    try {
      data = await CoinData().getCryptoData();
      setState(() {
        displayPrice = data.toString();
        print(displayPrice);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return displayPrice.isNotEmpty
        ? Column(
            children: [
              Expanded(
                child: TransactionFuture(displayPrice: displayPrice),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  LargeButton(
                    title: "Reload Price Ticker",
                    func: () async {
                      data = await CoinData().getCryptoData();
                      setState(() {
                        getData();
                      });
                    },
                  ),
                  LargeButton(
                      func: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditScreen(false)));
                      },
                      title: "Add Transaction")
                ]),
              ),
            ],
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
