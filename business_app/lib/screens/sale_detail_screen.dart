import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SaleDetailScreen extends StatelessWidget {
  static const routeName = '/sale-detail';
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
        child: Text(text, style: Theme.of(context).textTheme.title),
        margin: EdgeInsets.symmetric(vertical: 10));
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final saleData = ModalRoute.of(context).settings.arguments as Map;
    final shopName = saleData['shopName'];
    final quantity = saleData['quantity'];
    final pricePerItem = saleData['pricePerItem'];
    final otherExpense = saleData['otherExpense'];
    final otherExpenseNote = saleData['otherExpenseNote'];
    final date = saleData['date'];

    return Scaffold(
        appBar: AppBar(title: Text('Sale Details')),
        body: Container(
            height: 500,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Shop Name: $shopName',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  'Date of Sale: ${DateFormat.yMMMMd().format(date)}',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  'Quantity Sold: ${quantity.toStringAsFixed(0)}',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  'Price Per Item: $pricePerItem',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  'Other Expense: ${otherExpense.toStringAsFixed(0)}',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  'Other Expense Note: $otherExpenseNote',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            )));
  }
}
