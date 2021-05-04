import 'package:flutter/material.dart';
import 'package:youtube_crypto/db/database.dart';
import 'package:youtube_crypto/models/purchase.dart';
import 'package:youtube_crypto/screens/edit/edit_screen.dart';
import 'package:youtube_crypto/screens/home/home_screen.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key key,
    @required GlobalKey<FormState> formkey,
    @required this.widget,
    @required this.nameController,
    @required this.priceController,
    @required this.amountController,
  }) : _formkey = formkey, super(key: key);

  final GlobalKey<FormState> _formkey;
  final EditScreen widget;
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xff07f2a0),
      ),
      child: Text(
        "Save",
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
      onPressed: () async {
        if (!_formkey.currentState.validate()) {
          Scaffold.of(context)
              .showBottomSheet((context) => Text("Processing Data"));
        } else if (widget.edit == true) {
          PurchaseDatabaseProvider.db.updatePurchase(new Purchase(
              name: nameController.text,
              atPrice: double.parse(priceController.text),
              amount: double.parse(amountController.text),
              id: widget.purchase.id));
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false,
          );
        } else {
          await PurchaseDatabaseProvider.db.addPurchase(
            new Purchase(
                name: nameController.text,
                atPrice: double.parse(priceController.text),
                amount: double.parse(amountController.text)),
          );
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false);
        }
      },
    );
  }
}
