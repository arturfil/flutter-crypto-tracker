import 'package:flutter/material.dart';
import 'package:youtube_crypto/models/purchase.dart';
import 'package:youtube_crypto/screens/edit/body.dart';

class EditScreen extends StatefulWidget {
  final bool edit;
  final Purchase purchase;

  EditScreen(this.edit, {this.purchase})
      : assert(edit == true || purchase == null);

  @override
  _EdtiScreenState createState() => _EdtiScreenState();
}

class _EdtiScreenState extends State<EditScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.edit == true) {
      nameController.text = widget.purchase.name;
      priceController.text = widget.purchase.atPrice.toString();
      amountController.text = widget.purchase.amount.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff180338),
      appBar: AppBar(
        title: Text(
          widget.edit ? "Edit Transaciont" : "Add New Transaction",
          style: TextStyle(
            color: Color(0xff07f2a0),
            fontSize: 28.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Body(
        formkey: _formKey,
        nameController: nameController,
        widget: widget,
        priceController: priceController,
        amountController: amountController,
      ),
    );
  }
}
