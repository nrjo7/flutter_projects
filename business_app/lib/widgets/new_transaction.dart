import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/sales_transactions.dart';

class NewTransaction extends StatefulWidget {
  final String state;
  NewTransaction(this.state);
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _shopNameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _pricePerItemSoldController = TextEditingController();
  final _otherExpenseController = TextEditingController();
  final _otherExpenseNoteController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_shopNameController.text.isEmpty) {
      return;
    }
    if (_quantityController.text.isEmpty) {
      return;
    }
    if (_pricePerItemSoldController.text.isEmpty) {
      return;
    }
    if (_otherExpenseController.text.isEmpty) {
      return;
    }
    if (_otherExpenseNoteController.text.isEmpty) {
      return;
    }
    final enteredShopName = _shopNameController.text;
    final enteredQuantity = double.parse(_quantityController.text);
    final enteredPricePerItemSold =
        double.parse(_pricePerItemSoldController.text);
    final enteredOtherExpense = double.parse(_otherExpenseController.text);
    final enteredOtherExpenseNote = _otherExpenseNoteController.text;

    if (enteredShopName.isEmpty ||
        enteredQuantity <= 0 ||
        enteredPricePerItemSold <= 0 ||
        enteredOtherExpense < 0 ||
        _selectedDate == null) {
      return;
    }

    Provider.of<SaleData>(context,listen: false).addnewTx(
        enteredShopName,
        enteredQuantity,
        enteredPricePerItemSold,
        enteredOtherExpense,
        enteredOtherExpenseNote,
        _selectedDate,widget.state);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Shop Name'),
                controller: _shopNameController,
                onSubmitted: (_) => _submitData(),
                autofocus: true,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Quantity Sold'),
                controller: _quantityController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Price per Item sold'),
                controller: _pricePerItemSoldController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Other Expense'),
                controller: _otherExpenseController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Other Expense Note'),
                controller: _otherExpenseNoteController,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(_selectedDate == null
                              ? 'No Date Choosen!'
                              : 'Sale Date: ${DateFormat.yMd().format(_selectedDate)}')),
                      FlatButton(
                        textColor: Theme.of(context).primaryColor,
                        child: Text('Choose Date',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        onPressed: _presentDatePicker,
                      )
                    ],
                  )),
              RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  child: Text('Add Sales'),
                  onPressed: _submitData),
            ]),
      ),
    ));
  }
}
