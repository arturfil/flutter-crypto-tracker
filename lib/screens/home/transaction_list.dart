import 'package:flutter/material.dart';
import 'package:youtube_crypto/models/purchase.dart';
import 'package:youtube_crypto/screens/edit/edit_screen.dart';

class TransactionList extends StatelessWidget {
  final Purchase item;
  final String displayPrice;

  TransactionList({
    Key key,
    @required this.item,
    @required this.displayPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        item.name,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        """

        ${item.amount} coins @ \$${item.atPrice}
        Initial Inv: \$${(item.amount * item.atPrice).toStringAsFixed(2)}
        Current Cap: \$${displayPrice.isNotEmpty ? (item.amount * double.parse(displayPrice)).toStringAsFixed(2) : 0}

        """,
        style: TextStyle(color: Colors.lightBlue, fontSize: 17.0),
      ),
      leading: CircleAvatar(
        child: Text(
          item.id.toString(),
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xff07f2a0),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditScreen(
              true,
              purchase: item,
            ),
          ),
        );
      },
    );
  }
}
