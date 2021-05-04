import 'package:flutter/material.dart';
import 'package:youtube_crypto/db/database.dart';
import 'package:youtube_crypto/models/purchase.dart';
import 'package:youtube_crypto/screens/home/transaction_list.dart';

class TransactionFuture extends StatelessWidget {
  TransactionFuture({Key key, @required this.displayPrice});
  final String displayPrice;

  @override
  Widget build(BuildContext context) {
    double sum = 0;
    return FutureBuilder<List<Purchase>>(
      future: PurchaseDatabaseProvider.db.getAllPurchases(),
      builder: (BuildContext context, AsyncSnapshot<List<Purchase>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Purchase item = snapshot.data[index];
                    sum += item.amount * double.parse(displayPrice);
                    return Dismissible(
                      background: Container(color: Colors.red),
                      onDismissed: (direction) {
                        PurchaseDatabaseProvider.db
                            .deletePurchaseWithId(item.id);
                      },
                      key: UniqueKey(),
                      child: TransactionList(
                        item: item,
                        displayPrice: displayPrice,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "TOT CAP: \$${(sum).toStringAsFixed(2)}",
                  style: TextStyle(
                      color: Color(0xff07f2a0),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Text(
                "DOGE PRICE: \$$displayPrice",
                style: TextStyle(
                    color: Color(0xff07f2a0),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
