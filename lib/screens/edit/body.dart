import 'package:flutter/material.dart';
import 'package:youtube_crypto/screens/edit/edit_screen.dart';
import 'package:youtube_crypto/screens/edit/save_button.dart';
import 'package:youtube_crypto/screens/edit/text_form_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required GlobalKey<FormState> formkey,
    @required this.nameController,
    @required this.amountController,
    @required this.priceController,
    @required this.widget,
  })  : _formkey = formkey,
        super(key: key);

  final GlobalKey<FormState> _formkey;
  final EditScreen widget;
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textFormField(
                  nameController,
                  "Name",
                  "Enter Name",
                  Icons.money_sharp,
                  widget.edit ? widget.purchase.name.toString() : "name",
                  false),
              textFormField(
                  priceController,
                  "Price",
                  "Enter Price",
                  Icons.business_center_outlined,
                  widget.edit ? widget.purchase.atPrice.toString() : "price",
                  true),
              textFormField(
                  amountController,
                  "Amount",
                  "Enter Amount",
                  Icons.monetization_on,
                  widget.edit ? widget.purchase.amount.toString() : "amount",
                  true),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: SaveButton(
                      formkey: _formkey,
                      widget: widget,
                      nameController: nameController,
                      priceController: priceController,
                      amountController: amountController),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
