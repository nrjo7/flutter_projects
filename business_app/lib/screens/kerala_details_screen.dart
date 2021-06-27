import 'package:flutter/material.dart';
import '../providers/sales_transactions.dart';
import 'package:provider/provider.dart';

class KeralaDetailsScreen extends StatelessWidget {
  static const routeName = '/kerala-details';
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

    return Scaffold(
        appBar: AppBar(title: Text('Kerala Sale Details')),
        body: Container(
            height: 300,
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
                Consumer<SaleData>(builder: (ctx,saleData,child)=>Text(
                  'Total Stocks Sold: ${saleData.totalStockSoldKerala.toStringAsFixed(0)}',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.title,
                )),
                Consumer<SaleData>(builder: (ctx,saleData,child)=>Text(
                  'Total Profit: ${saleData.totalProfitKerala.toStringAsFixed(0)}',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.title,
                )),
                Consumer<SaleData>(builder: (ctx,saleData,child)=>Text(
                  'Total Expense: ${saleData.totalExpenseKerala.toStringAsFixed(0)}',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.title,
                )),
                Consumer<SaleData>(builder: (ctx,saleData,child)=>Text(
                  'Net Profit: ${(saleData.totalProfitKerala-saleData.totalExpenseKerala).toStringAsFixed(0)}',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.title,
                )),
              ],
            )));
  }
}
